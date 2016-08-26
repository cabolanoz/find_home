require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:property) { create(:property) }

  describe "GET #index" do
    it "Assigns all properties as @properties" do
      get :index
      expect(assigns(:properties)).to eq([property])
    end
  end
end
