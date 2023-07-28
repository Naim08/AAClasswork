class ShortenUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true

  belongs_to :user
  has_many :visits
  has_many :visitors,
  Proc.new { distinct },
  through: :visits,
  source: :user

    # def self.random_code
    #   code = SecureRandom.urlsafe_base64
    #   while ShortenUrl.exists?(short_url: code)
    #     code = SecureRandom.urlsafe_base64
    #   end
    #   code
    # end

    after_initialize do
      self.short_url ||= ShortenUrl.random_code

    end
    def self.random_code
      code = SecureRandom.urlsafe_base64
      while ShortenUrl.exists?(short_url: code)
        code = SecureRandom.urlsafe_base64
      end
      code
    end

    def num_clicks
      visits.count
    end

    def num_uniques
      visitors.count
    end

    def num_recent_uniques
      visits.select(:user_id).distinct.where('created_at > ?', 10.minutes.ago).count
    end

    # def self.create_shorten_url(user, long_url)
    #   ShortenUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenUrl.random_code)
    # end

  # def num_clicks
  #   visits.count
  # end

  # def num_uniques
  #   visitors.count
  # end

  # def num_recent_uniques
  #   visits.select(:user_id).distinct.where('created_at > ?', 10.minutes.ago).count
  # end
end
