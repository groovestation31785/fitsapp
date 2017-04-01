require 'rails_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to validate_presence_of :subject }
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :sender_id }
  it { is_expected.to validate_presence_of :receiver_id }
  it { is_expected.to belong_to :sender }
  it { is_expected.to belong_to :receiver }

end
