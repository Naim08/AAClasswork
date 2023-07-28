class Visit < ApplicationRecord
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  belongs_to :shorten_url,
    primary_key: :id,
    foreign_key: :shorten_url_id,
    class_name: :ShortenUrl
end
