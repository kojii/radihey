require "spec_helper"

describe ButtonImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/button_images").should route_to("button_images#index")
    end

    it "routes to #new" do
      get("/button_images/new").should route_to("button_images#new")
    end

    it "routes to #show" do
      get("/button_images/1").should route_to("button_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/button_images/1/edit").should route_to("button_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/button_images").should route_to("button_images#create")
    end

    it "routes to #update" do
      put("/button_images/1").should route_to("button_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/button_images/1").should route_to("button_images#destroy", :id => "1")
    end

  end
end
