class Like < ApplicationRecord
  validates :likeable_type, presence: true
  validates :likeable_id, presence: true
  validates :liker_id, uniqueness: { scope: [:likeable_type, :likeable_id], 
    message: "can only like an artwork or comment once" }, presence: true 


  belongs_to :likeable, polymorphic: true

  belongs_to :liker,
    foreign_key: :liker_id,
    class_name: :User
end
