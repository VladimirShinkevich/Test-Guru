class User < ApplicationRecord
  def tests_by_level(level)  
    Test.joins("JOIN pass_tests ON tests.id = pass_tests.test_id").where("pass_tests.user_id = :user_id AND level = :level", { user_id: id, level: level })
  end
end
