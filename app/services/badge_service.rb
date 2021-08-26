# frozen_string_literal: true

class BadgeService
  attr_accessor :test_passage, :add_awards
  RULE = { first_test_passed: Badges::FirstTestPassed,
           pass_test_by_level: Badges::PassTestByLevel,
           pass_test_by_category: Badges::PassTestByCategory }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULE[badge.rule_type.to_sym].new(test_passage: @test_passage, value: badge.value)
      add_awards(badge) if rule.is_satiesfies?
    end
  end

  private

  def add_awards(badge)
    @test_passage.user.badges << badge unless @test_passage.user.badges.ids.include?(badge.id)
  end
end
