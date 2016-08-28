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

FactoryGirl.define do
  factory :property do
    title { Faker::Name.title }
    property_type { create(:property_type) }
    description { Faker::Lorem.sentence }
  end
end
