# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  belongs_to :user, :primary_key => true
  has_many :videos, foreign_key: :uploader_id, dependent: :destroy
  has_many :comments, foreign_key: :commenter_id, dependent: :destroy
  has_many :likes, foreign_key: :liker_id, dependent: :destroy
  has_many :liked_videos, through: :likes, source: :video
  has_many :videos_commented, through: :comments, source: :video
  has_many :likers, through: :videos, source: :likers


end
