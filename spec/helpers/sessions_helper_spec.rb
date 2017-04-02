require 'rails_helper'

describe SessionsHelper, type: :helper do
  let!(:client) { create(:client) }

  describe "#current_client" do
    it 'returns the current client' do
      log_in client
      expect(current_client).to eq client
    end

    it 'returns nil if not logged in' do
      expect(current_client).to be_nil
    end
  end

  describe "#logged_in?" do
    it 'returns the client if client logged in' do
      log_in client
      expect(logged_in?).to eq client
    end

    it "returns nil if client isn't logged in" do
      expect(logged_in?).to be_nil
    end
  end

  describe "#log_in client" do
    it 'logs the client in' do
      log_in client
      expect(current_client).to eq client
    end
  end

  describe "#logout" do
    it 'logs the client out' do
      log_in client
      expect(current_client).to eq client
      log_out
      expect(current_client).to be_nil
    end
  end
end
