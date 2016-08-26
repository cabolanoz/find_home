require "rails_helper"

RSpec.describe Feature, type: :model do
  it "Empty feature should not be valid" do
      expect(Feature.new).to_not be_valid
  end
end
