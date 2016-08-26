require "rails_helper"

RSpec.describe Property, type: :model do
  describe "Wrong ways to create a new Property" do
    it "Empty property should not be valid" do
      property = Property.new
      expect(property).to_not be_valid
    end

    it "Property without title or description should not be valid" do
      property = Property.new(title: Faker::Name.title)
      expect(property).to_not be_valid
      property = Property.new(description: Faker::Lorem.sentence)
      expect(property).to_not be_valid
    end
  end
end
