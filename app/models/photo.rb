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
  validates_presence_of :uuid
  validates_presence_of :property
end
