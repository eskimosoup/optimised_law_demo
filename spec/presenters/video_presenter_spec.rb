require "rails_helper"

RSpec.describe VideoPresenter, type: :presenter do
  let(:video) { build(:video) }
  subject(:video_presenter) { VideoPresenter.new(object: video, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:video) }
  end

  describe "standard video" do
    it "should escape the youtube embed code" do
      expect(video_presenter.youtube_embed).to eq(raw(video.youtube_embed_code))
    end
  end

end