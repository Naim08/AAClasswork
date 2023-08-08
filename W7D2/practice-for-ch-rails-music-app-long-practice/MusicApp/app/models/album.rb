class Album < ApplicationRecord
  belongs_to :band
  validates :title, :year, :band_id, presence: true
  validates :album_type, inclusion: { in: %w(live studio), message: "%{value} is not a valid type" }
  validates :title, uniqueness: { scope: :band_id, message: "album title must be unique for band" }

    has_many :tracks,
      dependent: :destroy


  def band_name
    band.name
  end

  def band_name=(name)
    self.band = Band.find_by(name: name)
  end

  def track_names
    tracks.map { |track| track.title }
  end

  def track_names=(titles)
    titles.each do |title|
      self.tracks << Track.find_or_create_by(title: title)
    end
  end

  def live?
    self.album_type == 'live'
  end

  def studio?
    self.album_type == 'studio'
  end

end
