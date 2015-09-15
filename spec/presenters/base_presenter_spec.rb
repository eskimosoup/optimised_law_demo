require "rails_helper"

# this is pretty horrible but I don't know how to tidy it up
class MockUploader
  def self.versions
    { thumb: {}, index: {}, show: {} }
  end
end

class MockPage
  def self.uploaders
    { image: MockUploader, icon: MockUploader }
  end
end

RSpec.describe BasePresenter, type: :presenter do
  # don't actually care about anything other than the version names
  let(:mock_uploader) { MockUploader.new }
  let(:mock_page) { MockPage.new }

  subject(:base_presenter) { BasePresenter.new(object: mock_page, view_template: view) }

  it "should set the object on base_presenter to the double" do
    expect(base_presenter.object).to eq(mock_page)
  end

  it "should have image method" do
    expect(base_presenter.methods).to include(:image)
  end

  it "should have an icon method" do
    expect(base_presenter.methods).to include(:icon)
  end

  it "should have index_image method" do
    expect(base_presenter.methods).to include(:index_image)
  end

  it "should have show_image method" do
    expect(base_presenter.methods).to include(:show_image)
  end

  it "should have thumb_image method" do
    expect(base_presenter.methods).to include(:thumb_image)
  end

  it "should have index_icon method" do
    expect(base_presenter.methods).to include(:index_icon)
  end

  it "should have show_icon method" do
    expect(base_presenter.methods).to include(:show_icon)
  end

  it "should have thumb_icon method" do
    expect(base_presenter.methods).to include(:thumb_icon)
  end
end