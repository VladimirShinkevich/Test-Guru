class BadgeService
  attr_reader :user, :pass_test, :user_successfully_passed_tests

  RULE = { first_test_passed: Badges::FirstTestPassed,
           pass_test_by_level_easy: Badges::PassTestByLevelEasy,
           pass_test_by_category: Badges::PassTestByCategory }.freeze

  def initialize(user, pass_test)
    @user = user
    @pass_test = pass_test
    @user_successfully_passed_tests = []
    
    set_successfully_passed_test
  end

  def call
    awards_received = Badge.select do |badge|
      rule = RULE[badge.rule.rule_type.to_sym].new(@user, @pass_test, @user_successfully_passed_tests, badge )
      rule.is_satisfies?
    end

    user.badges.push(awards_received)
    awards_received
  end

  private

  def set_successfully_passed_test
    user_successfully_passed_tests_ids = user.test_passages.where(correct_passed_test: true).pluck(:test_id)
    user_successfully_passed_tests_ids.each { |id| @user_successfully_passed_tests << Test.find(id) }
  end

end
