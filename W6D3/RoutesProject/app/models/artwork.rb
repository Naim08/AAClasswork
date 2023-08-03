class Artwork < ApplicationRecord
  validates :artist, uniqueness:{scope: :title}
  validates :title, :img_url, :artist_id, presence: true



    belongs_to :artist,
      foreign_key: :artist_id,
      class_name: :User

      has_many :artwork_shares,
      foreign_key: :artwork_id,
      class_name: :ArtworkShare,
      inverse_of: :artwork,
      dependent: :destroy

      has_many :comments,
      foreign_key: :artwork_id,
      class_name: :Comment,
      inverse_of: :artwork,
      dependent: :destroy

      has_many :shared_viewers,
      through: :artwork_shares,
      source: :viewer

      has_many :likes, as: :likeable

      has_many :likers,
      through: :likes,
      source: :liker

  def self.favorite_artworks(user_id)
    Artwork
    .joins(:likes)
    .where('likes.liker_id = :user_id', user_id: user_id)
    .distinct
  end

  def self.artworks_shared_with_user_id(user_id)
    Artwork
    .joins(:shared_viewers)
    .where('artwork_shares.viewer_id = :user_id', user_id: user_id)
    .distinct
  end


end
