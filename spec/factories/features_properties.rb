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

FactoryGirl.define do
  factory :features_property do
    feature { create(:feature) }
    property { create(:property) }
    quantity { Faker::Number.number(1) }
  end
end
