FactoryGirl.define do
  factory :photo do
    feature { create(:feature) }
    property { create(:property) }
    quantity { Faker::Number.number(1) }
  end
end
