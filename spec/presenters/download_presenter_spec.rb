require "rails_helper"

RSpec.describe DownloadPresenter, type: :presenter do
  let(:download) { build(:download) }
  subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view)}

  describe "standard download" do
    it "returns the name" do
      expect(download_presenter.title).to eq(download.title)
    end

    it "returns nil for the download category name" do
      expect(download_presenter.category_name).to eq(nil)
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

  describe "standard download with category" do
    let(:download_category) { build(:download_category) }
    let(:download) { build(:download, download_category: download_category) }
    subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view)}

    it "returns the download category name" do
      expect(download_presenter.category_name).to eq(download.download_category.name)
    end
  end
end
