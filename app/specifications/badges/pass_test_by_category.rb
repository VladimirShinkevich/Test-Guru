module Badges
  class PassTestByCategory < BadgeRuleSpecification
    CATEGORY = "Backend".freeze

    def initialize(*args)
      super
      @select_by_category = Test.by_categories(CATEGORY)
      @user_successfully_passed_tests_by_category = Test.joins(:category).where( { id: user_successfully_passed_tests.pluck(:id) } ).where(categories: { title: CATEGORY })
    end

    def is_satisfies?
      (@select_by_category == @user_successfully_passed_tests_by_category)&&(test_passages.test.category.title == CATEGORY)&&(!user_contains_current_badge?)
    end

  end
end
