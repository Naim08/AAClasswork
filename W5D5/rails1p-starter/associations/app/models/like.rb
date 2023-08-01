# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :bigint           not null
#  video_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :liker, class_name: :User, foreign_key: :liker_id
  belongs_to :video
  validates :liker_id, presence: true
  validates :video_id, presence: true
  validates :liker_id, uniqueness: { scope: :video_id }
end
