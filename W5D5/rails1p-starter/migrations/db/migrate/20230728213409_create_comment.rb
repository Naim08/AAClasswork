class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.references :video, null: false, foreign_key: true, index: true
      t.references :commenter, null: false, foreign_key: { to_table: :users }, index: true
      t.references :parent_comment, foreign_key: { to_table: :comments }, index: true
      t.timestamps
    end
  end
end
