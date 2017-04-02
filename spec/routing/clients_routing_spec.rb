require "rails_helper"

RSpec.describe ClientsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/signup").to route_to("clients#new")
    end

    it "routes to #new" do
      expect(:get => "/signup").to route_to("clients#new")
    end

    it "routes to #create" do
      expect(:post => "clients").to route_to("clients#create")
    end
  end
end
