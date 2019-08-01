class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :artist_id, uniqueness: { scope: :title, message: "[artist_id, title] must be unique" }, presence: true

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User
  
  has_many :shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

end
