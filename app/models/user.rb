require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authors_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  has_secure_password

  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password , presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates :password , confirmation: true
  
  def tests_by_level(level)  
    Test.joins(:test_passage).where(test_passages: {user_id: id}, level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
