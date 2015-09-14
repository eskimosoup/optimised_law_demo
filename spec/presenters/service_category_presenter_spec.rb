require "rails_helper"

RSpec.describe ServiceCategoryPresenter, type: :presenter do

  describe "standard service_category" do
    let(:service_category) { build(:service_category) }
    subject(:service_category_presenter) { ServiceCategoryPresenter.new(object: service_category, view_template: view)}

    it "returns the name" do
      expect(service_category_presenter.name).to eq(service_category.name)
    end

    it "returns the summary - html escaped" do
      content = raw(service_category.summary)
      expect(service_category_presenter.summary).to eq(content)
    end

  end

  describe "image testing" do
    describe "no image" do
      let(:service_category) { build(:service_category) }
      subject(:service_category_presenter) { ServiceCategoryPresenter.new(object: service_category, view_template: view)}
      it "index_image should return nil" do
        expect(service_category_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(service_category_presenter.show_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:service_category) { build(:service_category_with_image) }
      subject(:service_category_presenter) { ServiceCategoryPresenter.new(object: service_category, view_template: view)}
      it "index_image should return nil" do
        expect(service_category_presenter.index_image).to eq(image_tag(service_category.image.index, title: service_category.name, alt: service_category.name))
      end

      it "show_image should return nil" do
        expect(service_category_presenter.show_image).to eq(image_tag(service_category.image.show, title: service_category.name, alt: service_category.name))
      end
    end
  end
end
