class Track < ApplicationRecord
  belongs_to :album
  validates :title, :ord, :album_id, presence: true
  validates :track_type, inclusion: { in: %w(regular bonus), message: "%{value} is not a valid type" }
  validates :ord, uniqueness: { scope: :album_id, message: "track number must be unique for album" }

  has_one :band,
    through: :album,
    source: :band


    def album_title
      album.title
    end

    def album_title=(title)
      self.album = Album.find_by(title: title)
    end

    def band_name
      album.band.name
    end

    def band_name=(name)
      self.album = Album.find_by(name: name)
    end

    def bonus?
      self.track_type == 'bonus'
    end

    def regular?
      self.track_type == 'regular'
    end
end
