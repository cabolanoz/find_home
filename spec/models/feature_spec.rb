# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Feature, type: :model do
  it "Empty feature should not be valid" do
    expect(Feature.new).to_not be_valid
  end
end
