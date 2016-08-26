# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  uuid        :string           not null
#  property_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Photo < ApplicationRecord
  belongs_to :property
  validates_presence_of :property

  before_create :set_uuid
  before_update :forbid_update_uuid

  private
    def set_uuid
      self.uuid = SecureRandom.uuid if self.uuid.blank?
    end

    def forbid_update_uuid
      self.uuid = self.uuid_was if self.uuid_changed?
    end
end
