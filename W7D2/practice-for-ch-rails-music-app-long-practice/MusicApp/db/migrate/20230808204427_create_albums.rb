class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.references :band, null: false, foreign_key: true
      t.string :title, null: false
      t.datetime :year, null: false

      t.timestamps
    end
    ActiveRecord::Base.connection.execute <<~SQL
    CREATE TYPE type AS ENUM ('live', 'studio');
  SQL

  add_column :albums, :type, :type, null: false, default: 'studio'
end
end
