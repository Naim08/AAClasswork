class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :viewer, null: false, foreign_key: {to_table: :users}, index:{ unique: true}
      t.references :artwork, null: false, foreign_key: true,  index: { unique: true}

      t.timestamps
    end
  end
end
