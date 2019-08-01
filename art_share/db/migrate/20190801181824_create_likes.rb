class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :comment_id
      t.integer :artwork_id
      t.index [:liker_id, :comment_id, :artwork_id], unique: true, name: :likes_unique
      t.index :liker_id
      t.index :comment_id
      t.index :artwork_id
      t.timestamps
    end
  end
end
