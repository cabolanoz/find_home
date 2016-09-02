# == Schema Information
#
# Table name: photos
#
#  id           :integer          not null, primary key
#  uuid         :string           not null
#  property_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content_type :string
#

FactoryGirl.define do
  factory :photo do
    property { create(:property) }
    content_type { "image/jpeg" }
  end
end
