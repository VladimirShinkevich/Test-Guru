class Test < ApplicationRecord
  def self.tests_by_categories(category_title)
    joins(:categories).where(categories: { title: category_title }).order(id: :desc).pluck(:tests)
  end	
end
