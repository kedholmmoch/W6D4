class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :artist_id, uniqueness: { 
    scope: :title, message: "[artist_id, title] must be unique" 
  }, presence: true
  validates :favorite, inclusion: { in: [true, false] }

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User
  
  has_many :shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :likes, as: :likeable, dependent: :destroy

  has_many :likers,
    through: :likes,
    source: :liker

  has_many :collection_contents,
    foreign_key: :artwork_id,
    class_name: :CollectionContent,
    dependent: :destroy

  has_many :collections,
    through: :collection_contents,
    source: :collection

end
