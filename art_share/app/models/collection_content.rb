class CollectionContent < ApplicationRecord
  validates :collection_id, presence: true, uniqueness: {
    scope: :artwork_id, 
    message: "can only have each artwork once"
  }
  validates :artwork_id, presence: true

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
  
  belongs_to :collection,
    foreign_key: :collection_id,
    class_name: :Collection
end
