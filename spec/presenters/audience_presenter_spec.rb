require "rails_helper"

RSpec.describe AudiencePresenter, type: :presenter do

  describe "standard audience" do
    let(:audience) { build(:audience) }
    subject(:audience_presenter) { AudiencePresenter.new(object: audience, view_template: view)}

    it "returns the name" do
      expect(audience_presenter.name).to eq(audience.name)
    end

    it "returns the layout" do
      expect(audience_presenter.layout).to eq(audience.layout)
    end

    it "returns the summary - html escaped" do
      content = simple_format(audience.summary)
      expect(audience_presenter.summary).to eq(content)
    end

    it "returns the content - html escaped" do
      content = raw(audience.content)
      expect(audience_presenter.content).to eq(content)
    end
  end

  describe "image testing" do
    describe "no image" do
      let(:audience) { build(:audience) }
      subject(:audience_presenter) { AudiencePresenter.new(object: audience, view_template: view)}
      it "index_image should return nil" do
        expect(audience_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(audience_presenter.show_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:audience) { build(:audience_with_image) }
      subject(:audience_presenter) { AudiencePresenter.new(object: audience, view_template: view)}
      it "index_image should return nil" do
        expect(audience_presenter.index_image).to eq(image_tag(audience.image.index, title: audience.name, alt: audience.name))
      end

      it "show_image should return nil" do
        expect(audience_presenter.show_image).to eq(image_tag(audience.image.show, title: audience.name, alt: audience.name))
      end
    end
  end
end
