require "rails_helper"

RSpec.describe MetricsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/metrics").to route_to("metrics#index")
    end

    it "routes to #show" do
      expect(get: "/metrics/1").to route_to("metrics#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/metrics").to route_to("metrics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/metrics/1").to route_to("metrics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/metrics/1").to route_to("metrics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/metrics/1").to route_to("metrics#destroy", id: "1")
    end
  end
end
