class User < ApplicationRecord
  validates :name, presence: true


  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork,
    inverse_of: :artist,
    dependent: :destroy

  has_many :artwork_shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    inverse_of: :viewer,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  has_many :comments,
  foreign_key: :user_id,
  class_name: :Comment,
  inverse_of: :author,
  dependent: :destroy

  has_many :likes,
  foreign_key: :liker_id,
  class_name: :Like,
  inverse_of: :liker,
  dependent: :destroy

  has_many :liked_comments,
  through: :likes,
  source: :likeable,
  source_type: :Comment

  has_many :liked_artworks,
  through: :likes,
  source: :likeable,
  source_type: :Artwork
  def self.search_by_name(name)
    User.where("name LIKE ?", "%#{name}%")
  end
end
