
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
     get :index, params: { query: property.title, search_type: :title }
     expect(assigns(:properties)).to eq([property])
   end

   it "Should filter empty properties with bogus query" do
     get :index, params: { query: "bogus title", search_type: :title }
     expect(assigns(:properties)).to eq([])
   end

   it "Should default to fetch all properties if search_type or query is missing" do
     get :index, params: { query: "bogus title" }
     expect(assigns(:properties)).to eq([property])
   end

   it "Should default to fetch all properties if query is missing" do
     get :index, params: { search_type: :title }
     expect(assigns(:properties)).to eq([property])
   end
 end
end
