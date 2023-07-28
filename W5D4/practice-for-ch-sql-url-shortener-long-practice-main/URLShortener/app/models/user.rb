class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

    has_many :shorten_urls
    has_many :visits
    has_many :visited_urls, through: :visits, source: :shorten_url
end
