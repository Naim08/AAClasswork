# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  body              :string           not null
#  video_id          :bigint           not null
#  commenter_id      :bigint           not null
#  parent_comment_id :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :commenter, class_name: :User, foreign_key: :commenter_id
  belongs_to :video
  belongs_to :parent_comment, class_name: :Comment, optional: true
  has_many :replies, class_name: :Comment, foreign_key: :parent_comment_id, dependent: :destroy
  has_one :parent_commenter, through: :parent_comment, source: :commenter, dependent: :destroy
  validates :body, presence: true
  validates :commenter_id, presence: true
  validates :video_id, presence: true
  validates :parent_comment_id, presence: true, allow_nil: true


end
