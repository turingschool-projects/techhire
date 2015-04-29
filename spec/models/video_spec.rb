require 'rails_helper'

RSpec.describe Video, type: :model do
  it "should be invalid with a slot of 5" do
    video = build(:video, slot: 5)

    expect(video).to be_invalid
  end

  it "should be invalid with a blank url" do
    video = build(:video, url: "")
    video.save

    expect(video.errors.full_messages.to_sentence).to eql("Error Please enter a valid url.")
    expect(video).to be_invalid
  end

  it "should be valid with a lot of 1,2,3 or 4" do
    video1 = build(:video, slot:1)
    video2 = build(:video, slot:2)
    video3 = build(:video, slot:3)
    video4 = build(:video, slot:4)
    video5 = build(:video, slot:nil)

    expect(video1).to be_valid
    expect(video2).to be_valid
    expect(video3).to be_valid
    expect(video4).to be_valid
    expect(video5).to be_valid
  end

  it "should be invalid with an invalid page name" do
    video = build(:video, page:"zzzzz")

    expect(video).to be_invalid
    expect(video.errors).not_to be_empty
  end

  it "should be valid with a valid page name" do
    video1 = build(:video, page:"tools and resources")
    video2 = build(:video, page:"tools and resourceS")
    video3 = build(:video, page:"zzzz")
    video4 = build(:video, page:"learn more")
    video5 = build(:video, page:"home")

    expect(video1).to be_valid
    expect(video2).to be_invalid
    expect(video3).to be_invalid
    expect(video4).to be_valid
    expect(video5).to be_valid
  end
end
