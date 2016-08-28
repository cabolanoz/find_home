class FeaturesPropertyCreate
  def initialize(property)
    @property = property
  end

  def create(features, quantities)
    # Iterate through all features added to property
    for i in 0..features.count - 1
      # Skip saving those features that has no quantity
      next if quantities[i].empty? || quantities[i].to_i <= 0

      # Create new features properties
      @property.features_properties.create!(
        feature_id: features[i],
        property: @property,
        quantity: quantities[i].to_i
      )
    end
  end
end
