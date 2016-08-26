require "rails_helper"

RSpec.describe Photo, type: :model do
  it "Validates uuid is present once the photo is created" do
    photo = Photo.create(property: create_property)
    expect(photo.uuid).to_not be_nil
  end

  it "Validates uuid is read-only" do
    photo = Photo.create(property: create_property)
    expect(photo.uuid).to_not be_nil

    uuid = photo.uuid
    photo.update_attributes(uuid: Faker::Code.ean)
    expect(photo.uuid).to be_eql(uuid)
  end

  def create_property
    property_type = PropertyType.create!(name: Faker::Hipster.word)
    Property.create!(
      title: Faker::Name.title,
      property_type: property_type,
      description: Faker::Lorem.sentence
    )
  end
end
