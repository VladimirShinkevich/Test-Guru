# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_user, dependent: :destroy
  has_many :users, through: :badge_user

  validates :title, :image, :rule_type, :value, presence: true
end
