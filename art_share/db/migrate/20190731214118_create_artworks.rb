class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.integer :artist_id, null: false
      t.string :image_url, null: false
      t.index [:artist_id, :title], unique: true, name: :artist_title
      t.index :artist_id, name: :artist_id
      t.index :title, name: :title
      t.timestamps
    end
  end
end
