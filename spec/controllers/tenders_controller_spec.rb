require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TendersController do

  # This should return the minimal set of attributes required to create a valid
  # Tender. As you add validations to Tender, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TendersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all tenders as @tenders" do
      tender = Tender.create! valid_attributes
      get :index, {}, valid_session
      assigns(:tenders).should eq([tender])
    end
  end

  describe "GET show" do
    it "assigns the requested tender as @tender" do
      tender = Tender.create! valid_attributes
      get :show, {:id => tender.to_param}, valid_session
      assigns(:tender).should eq(tender)
    end
  end

  describe "GET new" do
    it "assigns a new tender as @tender" do
      get :new, {}, valid_session
      assigns(:tender).should be_a_new(Tender)
    end
  end

  describe "GET edit" do
    it "assigns the requested tender as @tender" do
      tender = Tender.create! valid_attributes
      get :edit, {:id => tender.to_param}, valid_session
      assigns(:tender).should eq(tender)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Tender" do
        expect {
          post :create, {:tender => valid_attributes}, valid_session
        }.to change(Tender, :count).by(1)
      end

      it "assigns a newly created tender as @tender" do
        post :create, {:tender => valid_attributes}, valid_session
        assigns(:tender).should be_a(Tender)
        assigns(:tender).should be_persisted
      end

      it "redirects to the created tender" do
        post :create, {:tender => valid_attributes}, valid_session
        response.should redirect_to(Tender.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tender as @tender" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tender.any_instance.stub(:save).and_return(false)
        post :create, {:tender => {}}, valid_session
        assigns(:tender).should be_a_new(Tender)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tender.any_instance.stub(:save).and_return(false)
        post :create, {:tender => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tender" do
        tender = Tender.create! valid_attributes
        # Assuming there are no other tenders in the database, this
        # specifies that the Tender created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Tender.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => tender.to_param, :tender => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested tender as @tender" do
        tender = Tender.create! valid_attributes
        put :update, {:id => tender.to_param, :tender => valid_attributes}, valid_session
        assigns(:tender).should eq(tender)
      end

      it "redirects to the tender" do
        tender = Tender.create! valid_attributes
        put :update, {:id => tender.to_param, :tender => valid_attributes}, valid_session
        response.should redirect_to(tender)
      end
    end

    describe "with invalid params" do
      it "assigns the tender as @tender" do
        tender = Tender.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tender.any_instance.stub(:save).and_return(false)
        put :update, {:id => tender.to_param, :tender => {}}, valid_session
        assigns(:tender).should eq(tender)
      end

      it "re-renders the 'edit' template" do
        tender = Tender.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tender.any_instance.stub(:save).and_return(false)
        put :update, {:id => tender.to_param, :tender => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tender" do
      tender = Tender.create! valid_attributes
      expect {
        delete :destroy, {:id => tender.to_param}, valid_session
      }.to change(Tender, :count).by(-1)
    end

    it "redirects to the tenders list" do
      tender = Tender.create! valid_attributes
      delete :destroy, {:id => tender.to_param}, valid_session
      response.should redirect_to(tenders_url)
    end
  end

end
