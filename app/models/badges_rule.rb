class BadgesRule < ApplicationRecord
	has_many :badges, foreign_key: "rule_id", dependent: :destroy
end
