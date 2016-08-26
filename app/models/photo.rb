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

  private
    def set_uuid
      self.uuid = SecureRandom.uuid if self.uuid.blank?
    end
end
