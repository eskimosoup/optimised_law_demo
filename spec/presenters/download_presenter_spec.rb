require "rails_helper"

RSpec.describe DownloadPresenter, type: :presenter do
  let(:download) { build(:download) }
  subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view)}

  describe "standard download" do
    it "returns the name" do
      expect(download_presenter.title).to eq(download.title)
    end

    # it "returns the presented audience" do
    #  expect(download_presenter.presented_audience).to eq(AudiencePresenter.new(object: download.services.first.department.audience, view_template: view))
    # end

    it "returns nil for the download category name" do
      expect(download_presenter.category_name).to eq(nil)
    end

    it "returns nil for the linked download category name" do
      expect(download_presenter.category_name_link).to eq(nil)
    end

    it "returns the index image" do
      expect(download_presenter.index_image(alt: download.title)).to eq(image_tag(download.image.index, alt: download.title))
    end

    it "returns the show image" do
      expect(download_presenter.show_image(alt: download.title)).to eq(image_tag(download.image.show, alt: download.title))
    end

    it "returns the homepage image" do
      expect(download_presenter.homepage_image(alt: download.title)).to eq(image_tag(download.image.homepage, alt: download.title))
    end

    it "returns the download link" do
      expect(download_presenter.download_link).to eq(link_to download.title, download.file.url)
    end

    it "returns the download link with customised content" do
      expect(download_presenter.download_link('Download now')).to eq(link_to 'Download now', download.file.url)
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

    it "returns the linked download category name" do
      expect(download_presenter.category_name_link).to eq(link_to download.download_category.name, '#', class: 'invalid-link', title: download.download_category.name)
    end
  end
end
