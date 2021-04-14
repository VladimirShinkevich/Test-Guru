class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :pass_tests, dependent: :destroy
  has_many :users, through: :pass_tests

  def self.tests_by_categories(category_title)
    joins(:categories).where(categories: { title: category_title }).order(id: :desc).pluck(:title)
  end	
end
