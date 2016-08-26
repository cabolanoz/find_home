FactoryGirl.define do
  factory :feature do
    name { Faker::Name.title }
  end
end
