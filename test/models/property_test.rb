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

require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end