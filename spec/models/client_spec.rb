require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :username }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to have_many :sent_messages }
    it { is_expected.to have_many :received_messages }
  end
end
