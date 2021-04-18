class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates_associated :tests
  validates :title, presence: true

  default_scope { order(title: :asc) }

end
