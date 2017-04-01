class Message < ApplicationRecord
  belongs_to :sender, class_name: "Client", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "Client", foreign_key: "receiver_id"

  validates :subject, :content, :sender_id, :receiver_id, presence: true
  validates :sender_id, :receiver_id, numericality: true
end
