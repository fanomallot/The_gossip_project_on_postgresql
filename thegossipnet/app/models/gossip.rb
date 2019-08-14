class Gossip < ApplicationRecord
	validates :title, 
	presence: true,
	length: { in: 3..30 }
	validates :content,
	presence: true
	belongs_to :user
	has_many :relations 
	has_many :tags,through: :relations
	has_many :comments
	has_many :relationlgs
  	has_many :likes, through: :relationlgs
end
