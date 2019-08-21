class User < ApplicationRecord
  belongs_to :city
  has_many :relationups
  has_many :commentcomments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages,through: :relationups, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :gossips
  has_many :comments
  has_secure_password
  has_many :likes
  validates :first_name,
  length: {in: 3..50}
  validates :last_name,
  length: {minimum: 3},
  presence: true
  validates :email,
  presence: true
  validates :city,
  presence: true
  validates :password,
  presence: true,
  length: {minimum: 6}
  validates :age, numericality: true,
  inclusion: {in: 15..90}
end
