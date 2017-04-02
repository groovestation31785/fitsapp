require 'bcrypt'

class Client < ApplicationRecord
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"

  validates :name, :email, :username, presence: true
  validates_inclusion_of :trainer, in: [true, false]
  validates :email, :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(username, password)
  return self if self.password == password && self.username == username
  nil
end

end
