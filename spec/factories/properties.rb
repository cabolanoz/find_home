FactoryGirl.define do
  factory :property do
    title { Faker::Name.title }
    property_type { create(:property_type) }
    description { Faker::Lorem.sentence }
  end
end
