require "spec_helper"

describe ButtonSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/button_sets").should route_to("button_sets#index")
    end

    it "routes to #new" do
      get("/button_sets/new").should route_to("button_sets#new")
    end

    it "routes to #show" do
      get("/button_sets/1").should route_to("button_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/button_sets/1/edit").should route_to("button_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/button_sets").should route_to("button_sets#create")
    end

    it "routes to #update" do
      put("/button_sets/1").should route_to("button_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/button_sets/1").should route_to("button_sets#destroy", :id => "1")
    end

  end
end
