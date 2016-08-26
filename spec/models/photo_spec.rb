require "rails_helper"

RSpec.describe Photo, type: :model do
  it "Validates uuid is present" do
    expect(Photo.new(property: create_property)).to_not be_valid
  end

  it "Validates property is present" do
    expect(Photo.new(uuid: 'Bogus uuid')).to_not be_valid
  end

  def create_property
    property_type = PropertyType.create!(name: "Bogus property type")
    Property.create!(
      title: "Bogus title",
      property_type: property_type,
      description: "Bogus description"
    )
  end
end
