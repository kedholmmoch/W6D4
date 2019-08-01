class CreateCollectionContents < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_contents do |t|
      t.integer :collection_id, null: false
      t.integer :artwork_id, null: false
      t.index :collection_id
      t.index :artwork_id
      t.index [:collection_id, :artwork_id], unique: true
      t.timestamps
    end
  end
end
