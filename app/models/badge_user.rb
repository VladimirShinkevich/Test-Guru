# frozen_string_literal: true

class BadgeUser < ApplicationRecord
  belongs_to :user
  belongs_to :badge
end
