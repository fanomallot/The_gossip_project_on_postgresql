class Tag < ApplicationRecord
	has_many :relations
	has_many :gossips,through: :relations
end
