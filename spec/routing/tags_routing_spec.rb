require "rails_helper"

RSpec.describe TagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/tags").to route_to("tags#index")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/tags").to route_to("tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/tags/1").to route_to("tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/tags/1").to route_to("tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/tags/1").to route_to("tags#destroy", :id => "1")
    end

  end
end
