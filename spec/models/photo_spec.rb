require "rails_helper"

RSpec.describe Photo, type: :model do
  let(:photo) { create(:photo) }

  it "Validates uuid is present once the photo is created" do
    expect(photo.uuid).to_not be_nil
  end

  it "Validates uuid is read-only" do
    expect(photo.uuid).to_not be_nil

    uuid = photo.uuid
    photo.update_attributes(uuid: Faker::Code.ean)
    expect(photo.uuid).to be_eql(uuid)
  end
end
