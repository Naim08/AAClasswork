class Like < ApplicationRecord
  validates :liker_id, uniqueness:{scope: [:likeable_id, :likeable_type]}
  validates :liker_id, :likeable_id, :likeable_type, presence: true

  belongs_to :liker,
    foreign_key: :liker_id,
    class_name: :User


  belongs_to :likeable,
  polymorphic: true

end
