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

class Photo < ApplicationRecord
  belongs_to :property
  validates_presence_of :property
  validates_presence_of :content_type

  before_create :set_uuid
  before_update :forbid_update_uuid

  def filename(type = "MEDIUM")
    return "#{uuid}1200x1200#{Rack::Mime::MIME_TYPES.invert[content_type]}" if type == "MEDIUM"
    return  "#{uuid}200x200#{Rack::Mime::MIME_TYPES.invert[content_type]}" if type == "THUMBNAIL"
  end

  private
    def set_uuid
      self.uuid = SecureRandom.uuid if self.uuid.blank?
    end

    def forbid_update_uuid
      self.uuid = self.uuid_was if self.uuid_changed?
    end
end
