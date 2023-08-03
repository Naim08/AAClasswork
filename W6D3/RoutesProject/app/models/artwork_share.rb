class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness:{scope: :viewer_id}
  validates :artwork_id, :viewer_id, presence: true




  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork,
    inverse_of: :artwork_shares

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User,
    inverse_of: :artwork_shares

  def self.artworks_shared_with_user_id(user_id)
    ArtworkShare
    .joins(:viewer)
    .where('artwork_shares.viewer_id = :user_id', user_id: user_id)
    .distinct
  end


end
