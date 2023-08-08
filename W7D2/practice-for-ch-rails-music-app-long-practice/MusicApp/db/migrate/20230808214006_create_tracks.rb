class CreateTracks < ActiveRecord::Migration[7.0]

  def change


    create_table :tracks do |t|


      t.references :album, null: false, foreign_key: true
      t.string :title, null: false
      t.integer :ord, null: false, unique: true
      t.string :lyrics, optional: true


      t.timestamps
    end
      ActiveRecord::Base.connection.execute <<~SQL
        CREATE TYPE track_type AS ENUM ('regular', 'bonus');
      SQL


      add_column :tracks, :track_type, :track_type, null: false, default: 'regular'
  end
end
