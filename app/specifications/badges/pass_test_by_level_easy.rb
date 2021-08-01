module Badges
  class PassTestByLevelEasy < BadgeRuleSpecification
    EASY_LEVEL = 0

    def initialize(*args)
      super
      @user_successfully_passed_tests_by_level_easy = Test.where({id: user_successfully_passed_tests.pluck(:id)}).where( { level: EASY_LEVEL} )
    end

    def is_satisfies?
      (Test.easy_level.ids.sort == @user_successfully_passed_tests_by_level_easy.ids.sort) && (test_passage.test.level == EASY_LEVEL) && (!user_contains_current_badge?)
    end
  end
end
