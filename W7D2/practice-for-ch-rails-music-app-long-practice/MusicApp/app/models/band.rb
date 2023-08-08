class Band < ApplicationRecord
  validates :name, presence: true, uniqueness: true

    has_many :albums, dependent: :destroy

    def album_names
      albums.map { |album| album.title }
    end

    def album_names=(titles)
      titles.each do |title|
        self.albums << Album.find_or_create_by(title: title)
      end
    end

    def live?
      self.album_type == 'live'
    end



end
