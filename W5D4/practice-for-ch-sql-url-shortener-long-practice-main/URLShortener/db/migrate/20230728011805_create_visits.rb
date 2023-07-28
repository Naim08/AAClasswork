class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shorten_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
