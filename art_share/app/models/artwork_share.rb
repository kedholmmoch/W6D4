class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness: { scope: :viewer_id, message: "can only be shared once!" }, presence: true
  validates :viewer_id, presence: true
  validates :favorite, inclusion: { in: [true, false] }

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
  
  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User
  
  
end
