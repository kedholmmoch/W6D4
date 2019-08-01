class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :artwork_id, null: false
      t.integer :author_id, null: false
      t.text :body, null: false
      t.index :artwork_id, name: :comments_artwork_id
      t.index :author_id, name: :comments_author_id
      t.timestamps
    end
  end
end
