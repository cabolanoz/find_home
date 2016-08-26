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
#

class Property < ApplicationRecord
  belongs_to :property_type
  validates_presence_of :title
  validates_presence_of :description
end
