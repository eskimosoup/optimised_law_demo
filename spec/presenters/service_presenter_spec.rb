require "rails_helper"

RSpec.describe ServicePresenter, type: :presenter do

  describe "standard service" do
    let(:service) { build(:service) }
    subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}

    it "returns the name" do
      expect(service_presenter.name).to eq(service.name)
    end

    it "returns the summary - html escaped" do
      content = simple_format(service.summary)
      expect(service_presenter.summary).to eq(content)
    end
  end

  describe "image testing" do
    describe "no image" do
      let(:service) { build(:service) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}
      it "index_image should return nil" do
        expect(service_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(service_presenter.show_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:service) { build(:service_with_image) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}
      it "index_image should return nil" do
        expect(service_presenter.index_image).to eq(image_tag(service.image.index, title: service.name, alt: service.name))
      end

      it "show_image should return nil" do
        expect(service_presenter.show_image).to eq(image_tag(service.image.show, title: service.name, alt: service.name))
      end
    end
  end
end
