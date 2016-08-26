FactoryGirl.define do
  factory :photo do
    property { create(:property) }
  end
end
