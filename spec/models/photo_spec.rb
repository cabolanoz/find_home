# == Schema Information
#
# Table name: photos
#
#  id           :integer          not null, primary key
#  uuid         :string           not null
#  property_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content_type :string
#

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

  describe "filename usage" do
    it "should return filename for THUMBNAIL and MEDIUM" do
      expect(photo.filename).to be_eql("#{photo.uuid}1200x1200.jpg")
      expect(photo.filename("THUMBNAIL")).to be_eql("#{photo.uuid}200x200.jpg")
    end

    it "should return nil for invalid type" do
      expect(photo.filename("randome_type_bogus")).to be_nil
    end

    it "should return nil when content_type is invalid" do
      photo.content_type = "random_content_type"
      expect(photo.filename).to be_nil
    end
  end
end
