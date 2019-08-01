class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      t.index [:artwork_id, :viewer_id], unique: true, name: :artwork_viewer
      t.index :artwork_id, name: :artwork_id
      t.index :viewer_id, name: :viewer_id
      t.timestamps
    end
  end
end
