class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates_associated :answers
  validates :body, presence: true

end
