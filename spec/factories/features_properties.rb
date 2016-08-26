FactoryGirl.define do
  factory :features_property do
    feature { create(:feature) }
    property { create(:property) }
    quantity { Faker::Number.number(1) }
  end
end
