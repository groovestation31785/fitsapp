require 'bcrypt'

class Client < ApplicationRecord
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

end
