require 'rails_helper'

RSpec.describe Video, type: :model do
  describe "validations", :validation do
    subject(:video) { build(:video) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:youtube_embed_code) }
    it { should validate_presence_of(:video_category) }
  end

  describe "associations", :association do
    it { should belong_to(:video_category) }
    it { should have_many(:service_videos).dependent(:destroy) }
    it { should have_many(:services).through(:service_videos) }
  end

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:video_category).with_prefix }
  end

  describe "modifying youtube embed code" do
    let(:video_category) { build(:video_category) }
    subject(:video) { Video.create(name: "my name", video_category: video_category,
                                youtube_embed_code: '<iframe width="900" height="450" src="https://www.youtube.com/embed/Xz-UvQYAmbg" frameborder="0" allowfullscreen></iframe>')}
    it "should modify height and width" do
      expect(video.youtube_embed_code).to eq('<iframe width="600" height="300" src="https://www.youtube.com/embed/Xz-UvQYAmbg" frameborder="0" allowfullscreen></iframe>')
    end
  end
end
