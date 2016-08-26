# == Schema Information
#
# Table name: property_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  status     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PropertyType < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_inclusion_of :status, in: [true, false]
end
