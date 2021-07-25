class Badge < ApplicationRecord
  has_many :badge_user, dependent: :destroy
  has_many :users, through: :badge_user

  validates :title, :rule, :value, presence: true
end
