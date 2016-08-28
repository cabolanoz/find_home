class CreateFeaturesPropertiesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :features_properties, id: false do |t|
      t.belongs_to :feature, index: true
      t.belongs_to :property, index: true
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
