class AddIndexForOrdInTracks < ActiveRecord::Migration[7.0]
  def change
    add_index :tracks, :ord, unique: true
    remove_index :tracks, :ord
    add_index :tracks, [:ord, :album_id], unique: true

  end
end
