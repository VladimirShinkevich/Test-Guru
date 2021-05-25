# frozen_string_literal: true

class PassTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
