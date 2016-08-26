class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.references :property_type, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
