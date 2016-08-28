class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :title, null: false
      t.references :property_type, foreign_key: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
