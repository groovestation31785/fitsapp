FactoryGirl.define do
  factory :message do
    subject "My subject line"
    content "My content"
    sender_id client
    receiver_id trainer
  end
end
