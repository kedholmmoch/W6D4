class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :title, null:false
      t.integer :owner_id, null: false
      t.index :owner_id, name: :collections_owner_id
      t.index :title, name: :collections_title
      t.index [:owner_id, :title], unique: true
      t.timestamps
    end
  end
end
