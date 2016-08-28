# == Schema Information
#
# Table name: features_properties
#
#  feature_id  :integer
#  property_id :integer
#  quantity    :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FeaturesProperty < ApplicationRecord
  belongs_to :feature
  belongs_to :property
  validates_presence_of :feature
  validates_presence_of :property
  validates_numericality_of :quantity, only_integer: true
end
