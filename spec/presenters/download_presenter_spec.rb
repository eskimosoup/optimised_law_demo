require "rails_helper"

RSpec.describe DownloadPresenter, type: :presenter do
  let(:download) { build(:download) }
  subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view)}

  describe "standard article" do
    it "returns the name" do
      expect(download_presenter.title).to eq(download.title)
    end

    it "returns the index image" do
      expect(download_presenter.index_image(alt: download.title)).to eq(image_tag(download.image.index, alt: download.title))
    end

    it "returns the index image" do
      expect(download_presenter.download_link).to eq(link_to download.title, download.file.url)
    end

    it "returns the summary - html formatted" do
      expect(download_presenter.summary).to eq(simple_format download.summary)
    end
  end
end
