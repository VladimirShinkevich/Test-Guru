class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level } 
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy_level, -> { where(level: 0..1) }
  scope :normal_level, -> { where(level: 2..4) } 
  scope :hard_level, -> { where(level: 5..Float::INFINITY) } 
  scope :by_categories, -> (category_title) { joins(:category).where(categories: { title: category_title }).order(id: :desc) }

  def self.titles_by_categories(category_title)
    by_categories(category_title).pluck(:title)
  end
end
