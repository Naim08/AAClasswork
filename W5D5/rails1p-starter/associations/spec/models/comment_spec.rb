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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { Comment.find_by_body("first") }
  subject(:comment2) { Comment.find_by_body("second") }

  it "is associated with a commenter" do
    expect(comment.commenter.username).to eq("gillian")
  end

  it "is associated with a video" do
    expect(comment.video.title).to eq("The Less I Know the Better")
  end

  it "can be associated with a parent comment" do
    expect(comment2.parent_comment.body).to eq("first")
  end

  it "can be associated with replies" do
    expect(comment.replies.first.body).to eq("second")
  end

  it "can be associated with a parent commenter" do
    expect(comment2.parent_commenter.username).to eq("gillian")
  end

  it "can be successfully destroyed" do
    expect { comment.destroy }.not_to raise_error
  end

  describe "validations" do
    it "allows comment to optionally be associated with a parent comment" do
      expect do
        Comment.create!(
          video: Video.find_by_title("Ball of Pizza"),
          commenter: User.find_by_username('gillian'),
          body: "I'm a parent"
        )
      end.to_not raise_error
    end
  end
end