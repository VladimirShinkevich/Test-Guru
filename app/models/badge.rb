class Badge < ApplicationRecord
  belongs_to :rule, class_name: "BadgesRule"

  has_many :badge_user, dependent: :destroy
  has_many :users, through: :badge_user

  validates :title, presence: true
end
