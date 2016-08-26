# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feature < ApplicationRecord
  has_many :features_properties
  has_many :properties, through: :features_properties
  validates_presence_of :name
end
