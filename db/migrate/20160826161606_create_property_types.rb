class CreatePropertyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :property_types do |t|
      t.string :name, null: false, unique: true
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
