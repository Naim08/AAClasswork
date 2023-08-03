class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :img_url, null: false
      t.references :artist, null: false, foreign_key: {to_table: :users}, index:{ unique: true}

      t.timestamps
    end
    add_index :artworks, [:artist_id, :title], unique:true
  end
end
