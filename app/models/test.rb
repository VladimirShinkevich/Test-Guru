class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :pass_tests, dependent: :destroy
  has_many :users, through: :pass_tests

  validates_associated :questions
  validates_associated :pass_tests
  validates_associated :users

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level } 
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy_level, -> { where(level: 0..1) }
  scope :normal_level, -> { where(level: 2..4) } 
  scope :hard_level, -> { where(level: 5..Float::INFINITY) } 
  scope :tests_by_categories, -> (category_title) { joins(:category).where(categories: { title: category_title }).order(id: :desc).pluck(:title) }
 
end
