class Comment < ApplicationRecord
  validates :artwork_id, presence: true
  validates :author_id, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User
  
  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  has_many :likes, as: :likeable, dependent: :destroy

  has_many :likers,
    through: :likes,
    source: :liker
end
