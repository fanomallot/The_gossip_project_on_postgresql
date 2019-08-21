class Like < ApplicationRecord
  belongs_to :user
  has_many :relationlcs
  has_many :comments, through: :relationlcs
  has_many :relationlgs
  has_many :gossips, through: :relationlgs
end
