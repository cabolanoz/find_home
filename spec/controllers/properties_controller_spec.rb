require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  describe "GET #index" do
    let(:property) { create(:property) }

    before :each do
      property
    end

    it "Assigns all properties as @properties" do
      get :index
      expect(assigns(:properties)).to eq([property])
    end

    it "Should filter properties based on search_type and query" do
      get :index, params: { search: property.title}
      expect(assigns(:properties)).to eq([property])
    end

    it "Should filter empty properties with bogus search" do
      get :index, params: { search: "bogus title"}
      expect(assigns(:properties)).to eq([])
    end
  end

  describe "GET #new" do
    let!(:property_types) {create_list(:property_type, 2)}

    it "should assign objects required for the view" do
      get :new
      expect(assigns(:property_types).count).to be_eql(property_types.count)
      expect(assigns(:features)).to_not be_nil
      expect(assigns(:property)).to_not be_nil
    end
  end

  describe "GET #edit" do
    let(:property) {create(:property)}

    it "should assign object required for the view" do
      get :edit, params:{ id: property.id }
      expect(assigns(:property_types).count).to be_eql(1)
      expect(assigns(:features)).to_not be_nil
      expect(assigns(:property)).to be_eql(property)
    end

    it "should return 404 when id is invalid" do
      get :edit, params:{ id: 1241 }
      expect(response.status).to be_eql(404)
    end
  end

  describe "POST #create" do
    let!(:property_type) {create(:property_type)}

    it "should create a property with proper parameters" do
      post :create, params: { property: attributes_for(:property).merge(property_type_id: property_type.id )  }
      expect(response).to have_http_status(302)
      expect(Property.count).to be_eql(1)
    end

    it "should create a property with proper parameters" do
      expect(post :create, params: { property: attributes_for(:property)  }).to render_template(:new)
    end

  end

  describe "PUT #update" do
    let!(:property) {create(:property)}

    it "should modify a property attribute properly" do
      expectedTitle = Faker::Name.title
      put :update, params: { id: property.id, property: {title: expectedTitle} }
      expect(Property.find(property.id).title).to be_eql(expectedTitle)
    end

    it "should returned 404 not found if property id is invalid" do
      bogus_id = 283
      put :update, params: { id: bogus_id, property: {title: Faker::Name.title} }
      expect(response).to have_http_status(404)
    end
  end


end
