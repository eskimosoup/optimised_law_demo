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

  describe "images" do
    describe "no image" do
      let(:video) { build(:video) }
      subject(:video_presenter) { VideoPresenter.new(object: video, view_template: view)}
      it "index_image should return nil" do
        expect(video_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(video_presenter.show_image).to eq(nil)
      end

      it "activity_stream_image should return nil" do
        expect(video_presenter.activity_stream_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:video) { build(:video_with_image) }
      subject(:video_presenter) { VideoPresenter.new(object: video, view_template: view)}
      it "index_image should return nil" do
        expect(video_presenter.index_image(alt: video.title)).to eq(image_tag(video.image.index, alt: video.title))
      end

      it "show_image should return nil" do
        expect(video_presenter.show_image(alt: video.title)).to eq(image_tag(video.image.show, alt: video.title))
      end

      it "activity_stream_image should not return nil" do
        expect(video_presenter.activity_stream_image(alt: video.title)).to eq(image_tag(video.image.activity_stream, alt: video.title))
      end
    end
  end
end
