class AddIndexForTitleInAbulm < ActiveRecord::Migration[7.0]
  def change
    add_index :albums, :title, unique: true
    remove_index :albums, :title
    add_index :albums, [:title, :band_id], unique: true
  end
end
