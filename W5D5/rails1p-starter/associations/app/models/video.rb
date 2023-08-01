# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  uploader_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Video < ApplicationRecord
  belongs_to :uploader, class_name: :User, foreign_key: :uploader_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :liker
  has_many :commenters, through: :comments, source: :commenter
  has_many :likers_comments, through: :likers, source: :comments
end
