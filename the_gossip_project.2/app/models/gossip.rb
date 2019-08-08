class Gossip < ApplicationRecord
	validates :title, 
	presence: true,
	length: { in: 3..30 }
	validates :content,
	presence: true
	belongs_to :user
	has_many :relations 
	has_many :tags,through: :relations
end
