require "spec_helper"

describe EcomicsController do
  describe "routing" do

    it "routes to #index" do
      get("/ecomics").should route_to("ecomics#index")
    end

    it "routes to #new" do
      get("/ecomics/new").should route_to("ecomics#new")
    end

    it "routes to #show" do
      get("/ecomics/1").should route_to("ecomics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ecomics/1/edit").should route_to("ecomics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ecomics").should route_to("ecomics#create")
    end

    it "routes to #update" do
      put("/ecomics/1").should route_to("ecomics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ecomics/1").should route_to("ecomics#destroy", :id => "1")
    end

  end
end
