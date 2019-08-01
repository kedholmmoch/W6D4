class AlterIndexLikes < ActiveRecord::Migration[5.2]
  def change
    remove_index :likes, name: :likeable
    add_index :likes, [:liker_id, :likeable_id, :likeable_type], unique: true
  end
end
