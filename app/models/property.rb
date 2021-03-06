# == Schema Information
#
# Table name: properties
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  property_type_id :integer
#  description      :text             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#

class Property < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :property_type
  has_many :photos, dependent: :destroy
  has_many :features_properties, dependent: :destroy
  has_many :features, through: :features_properties
  validates_presence_of :title
  validates_presence_of :property_type
  validates_presence_of :description
end
