class UpdateArtworkshare < ActiveRecord::Migration[7.0]
  def change
    remove_column :artwork_shares, :viewer_id
    remove_column :artwork_shares, :artwork_id
    add_column :artwork_shares, :viewer_id, :integer, references: {to_table: :users}, null: false
    add_column :artwork_shares, :artwork_id,:integer, references: {to_table: :artworks}, null: false
    add_index :artwork_shares, [:viewer_id, :artwork_id], unique: true
  end
end
