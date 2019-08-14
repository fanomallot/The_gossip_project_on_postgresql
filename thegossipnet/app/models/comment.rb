class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  has_many :relationlcs
  has_many :likes, through: :relationlcs
  validates :content,
  presence: true
end
