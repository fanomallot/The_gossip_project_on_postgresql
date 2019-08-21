class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :relationups
  has_many :recipients,through: :relationups, class_name: "User"
end
