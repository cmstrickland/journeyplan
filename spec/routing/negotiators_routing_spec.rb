require "rails_helper"

RSpec.describe NegotiatorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/negotiators").to route_to("negotiators#index")
    end

    it "routes to #new" do
      expect(:get => "/negotiators/new").to route_to("negotiators#new")
    end

    it "routes to #show" do
      expect(:get => "/negotiators/1").to route_to("negotiators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/negotiators/1/edit").to route_to("negotiators#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/negotiators").to route_to("negotiators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/negotiators/1").to route_to("negotiators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/negotiators/1").to route_to("negotiators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/negotiators/1").to route_to("negotiators#destroy", :id => "1")
    end

  end
end
