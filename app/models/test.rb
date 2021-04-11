class Test < ApplicationRecord
  def self.tests_by_categories(category_title)
    joins("JOIN categories ON tests.category_id = categories.id").where(categories: { title: category_title }).order(id: :desc).pluck(:title)
  end	
end
