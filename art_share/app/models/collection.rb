class Collection < ApplicationRecord
  validates :owner_id, uniqueness: { 
    scope: :title, message: "can have only one collection with that name" 
  }, presence: true
  validates :title, presence: true

  belongs_to :owner,
    foreign_key: :owner_id,
    class_name: :User

  has_many :collection_contents,
    foreign_key: :collection_id,
    class_name: :CollectionContent,
    dependent: :destroy
  
  has_many :artworks,
    through: :collection_contents,
    source: :artwork
end
