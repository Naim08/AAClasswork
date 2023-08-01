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

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.first }
  subject(:like) { Like.find_by(liker_id: user.id) }
  let(:video) { Video.find_by_id(like.video_id) }

  it "is associated with a liker" do
    expect(like.liker.username).to eq(user.username)
  end

  it "is associated with a video" do
    expect(like.video.title).to eq(video.title)
  end
end