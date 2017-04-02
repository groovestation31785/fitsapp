require 'bcrypt'

class Client < ApplicationRecord
  has_secure_password
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"

  validates :name, :email, :username, presence: true
  validates_inclusion_of :trainer, in: [true, false]
  validates :email, :username, uniqueness: true
end
