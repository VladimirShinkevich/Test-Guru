class User < ApplicationRecord
  has_many :pass_tests, dependent: :destroy
  has_many :tests, through: :pass_tests
  has_many :authors_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy


  def tests_by_level(level)  
    Test.joins(:pass_test).where(pass_tests: {user_id: id}, level: level)
  end
end
