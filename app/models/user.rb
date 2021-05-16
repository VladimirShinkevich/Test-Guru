require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authors_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  
  def tests_by_level(level)  
    Test.joins(:test_passage).where(test_passages: {user_id: id}, level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
