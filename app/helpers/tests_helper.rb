# frozen_string_literal: true

module TestsHelper
  TEST_LEVEL = { 0 => :easy, 1 => :easy, 2 => :normal, 3 => :normal, 4 => :advanced, 5 => :advanced, 6 => :hard }.freeze

  def test_level(test)
    TEST_LEVEL[test.level] || :professional
  end
end
