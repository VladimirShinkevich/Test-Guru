class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins(:pass_tests).where(pass_tests: { user_id: id, level: level })
  end
end
