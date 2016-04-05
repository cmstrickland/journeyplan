require 'rails_helper'

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

RSpec.describe JourneysController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Journey. As you add validations to Journey, be sure to
  # adjust the attributes here as well.
  let(:negotiator) { Fabricate(:negotiator) }
  let(:valid_attributes) {
    {
      negotiator_id: negotiator.id ,
      visits: [],
      starts: Faker::Time.forward
    }
  }

  let(:invalid_attributes) {
    {negotiator_id: -234, visits: ["cardboard"], starts: 55 }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JourneysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all journeys as @journeys" do
      journey = Fabricate(:journey)
      get :index, {}, valid_session
      expect(assigns(:journeys)).to eq([journey])
    end
  end

  describe "GET #show" do
    it "assigns the requested journey as @journey" do
      journey = Fabricate(:journey)
      get :show, {:id => journey.to_param}, valid_session
      expect(assigns(:journey)).to eq(journey)
    end
  end

  describe "GET #new" do
    it "assigns a new journey as @journey" do
      Fabricate(:negotiator)
      get :new, {}, valid_session
      expect(assigns(:journey)).to be_a_new(Journey)
    end
  end

  describe "GET #edit" do
    it "assigns the requested journey as @journey" do
      journey = Fabricate(:journey)
      get :edit, {:id => journey.to_param}, valid_session
      expect(assigns(:journey)).to eq(journey)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Journey" do
        expect {
          post :create, {:journey => valid_attributes}, valid_session
        }.to change(Journey, :count).by(1)
      end

      it "assigns a newly created journey as @journey" do
        post :create, {:journey => valid_attributes}, valid_session
        expect(assigns(:journey)).to be_a(Journey)
        expect(assigns(:journey)).to be_persisted
      end

      it "redirects to the created journey" do
        post :create, {:journey => valid_attributes}, valid_session
        expect(response).to redirect_to(Journey.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved journey as @journey" do
        post :create, {:journey => invalid_attributes}, valid_session
        expect(assigns(:journey)).to be_a_new(Journey)
      end

      it "re-renders the 'new' template" do
        post :create, {:journey => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { starts: Faker::Time.forward }
      }

      it "updates the requested journey" do
        journey = Fabricate(:journey)
        put :update, {:id => journey.to_param, :journey => new_attributes }, valid_session
        journey.reload
        expect(journey.starts).to eq new_attributes[:starts]
      end

      it "assigns the requested journey as @journey" do
        journey = Fabricate(:journey)
        put :update, {:id => journey.to_param, :journey => valid_attributes}, valid_session
        expect(assigns(:journey)).to eq(journey)
      end

      it "redirects to the journey" do
        journey = Fabricate(:journey)
        put :update, {:id => journey.to_param, :journey => valid_attributes}, valid_session
        expect(response).to redirect_to(journey)
      end
    end

    context "with invalid params" do
      it "assigns the journey as @journey" do
        journey = Fabricate(:journey)
        put :update, {:id => journey.to_param, :journey => invalid_attributes}, valid_session
        expect(assigns(:journey)).to eq(journey)
      end

      it "re-renders the 'edit' template" do
        journey = Fabricate(:journey)
        put :update, {:id => journey.to_param, :journey => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested journey" do
      journey = Fabricate(:journey)
      expect {
        delete :destroy, {:id => journey.to_param}, valid_session
      }.to change(Journey, :count).by(-1)
    end

    it "redirects to the journeys list" do
      journey = Fabricate(:journey)
      delete :destroy, {:id => journey.to_param}, valid_session
      expect(response).to redirect_to(journeys_url)
    end
  end

end
