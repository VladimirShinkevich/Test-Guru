module Badges
  class FirstTestPassed < BadgeRuleSpecification
    def is_satisfies?
      (test_passage.correct_passed_test?) && (user.test_passages.map(&:test).count(test_passage.test) == 1) && (!user_contains_current_badge?)
    end
  end
end
