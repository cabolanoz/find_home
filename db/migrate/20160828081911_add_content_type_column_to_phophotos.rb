class AddContentTypeColumnToPhophotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :content_type, :string
  end
end
