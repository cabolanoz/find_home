# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :feature do
    name { Faker::Name.title }
  end
end
