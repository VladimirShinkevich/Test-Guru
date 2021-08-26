# frozen_string_literal: true

module Badges
  class FirstTestPassed < BadgeRuleSpecification
    def is_satiesfies?
      first_try = TestPassage.where(test: @test_passage.test, user: @test_passage.user)
      first_try.count == 1 && first_try.first.test_success?
    end
  end
end
