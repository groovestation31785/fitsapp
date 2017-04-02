require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let!(:client) { create(:client) }
  let!(:message) { create(:message) }
  let!(:invalid_attributes) { {content: "Nothing to see here."} }

  before(:each) do
    request.session[:client_id] = client.id
  end

  describe "GET #new" do
    it "assigns a new message as @message" do
      get :new
      expect(assigns(:message)).to be_a_new(Message)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {post :create, params: { message: message} }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
        post :create, params: { message: message }
        expect(assigns(:message)).to be_a(Message)
        expect(assigns(:message)).to be_persisted
      end

      it "redirects to the created message" do
        post :create, params: { message: message }
        expect(response).to redirect_to(messages_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved message as @message" do
        post :create, params: { message: invalid_attributes}
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "re-renders the 'new' template" do
        post :create, params: { message: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end
end
