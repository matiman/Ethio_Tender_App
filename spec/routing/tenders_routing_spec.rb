require "spec_helper"

describe TendersController do
  describe "routing" do

    it "routes to #index" do
      get("/tenders").should route_to("tenders#index")
    end

    it "routes to #new" do
      get("/tenders/new").should route_to("tenders#new")
    end

    it "routes to #show" do
      get("/tenders/1").should route_to("tenders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tenders/1/edit").should route_to("tenders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tenders").should route_to("tenders#create")
    end

    it "routes to #update" do
      put("/tenders/1").should route_to("tenders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tenders/1").should route_to("tenders#destroy", :id => "1")
    end

  end
end
