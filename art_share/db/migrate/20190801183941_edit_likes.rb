class EditLikes < ActiveRecord::Migration[5.2]
  def change
    drop_table :likes
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.references :likeable, polymorphic: true, null: false
      t.index :liker_id
      t.index [:likeable_id, :likeable_type], unique: true, name: :likeable
      t.timestamps
    end

  end
end
