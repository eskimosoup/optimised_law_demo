require "rails_helper"

RSpec.describe ServicePresenter, type: :presenter do

  describe "standard service" do
    let(:service) { build(:service) }
    let(:service_category) { build(:service_category) }
    subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}

    it "returns the name" do
      expect(service_presenter.name).to eq(service.name)
    end

    it "returns the service category" do
      expect(service_presenter.service_category).to eq(service.service_category)
    end

    it "returns the service category name" do
      expect(service_presenter.service_category_name).to eq(service.service_category.name)
    end

    it "returns the slug" do
      expect(service_presenter.slug).to eq(service.slug)
    end

    it "returns the content" do
      content = raw(service.content)
      expect(service_presenter.content).to eq(content)
    end

    it "returns the summary - html escaped" do
      content = raw(service.summary)
      expect(service_presenter.summary).to eq(content)
    end

    it "returns the related services" do
      expect(service_presenter.related_services).to eq(service.service_category.services)
    end

    describe "links" do
      let(:service) { create(:service) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}

      it "returns the first service" do
        expect(service_presenter.first_service?).to eq(true)
      end

      it "returns the read more link" do
        link = link_to "More on #{service.name}", service, class: 'service-overview-read-more'
        expect(service_presenter.read_more_link).to eq(link)
      end

      it "returns the tab link with active for first service" do
        link = link_to service.name, "##{service.slug}", class: 'tab-toggle active'
        expect(service_presenter.tab_link).to eq(link)
      end

      it "returns the tab link without active" do
        # digging deeper to remove deprecation warnings
        #service_presenter.stub(:first_service?) { false }
        allow(service_presenter).to receive_messages(first_service?: false)
        link = link_to service.name, "##{service.slug}", class: 'tab-toggle'
        expect(service_presenter.tab_link).to eq(link)
      end
    end
  end

  describe "image testing" do
    describe "no image" do
      let(:service) { build(:service) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}
      it "index_image should return nil" do
        expect(service_presenter.sidebar_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(service_presenter.overview_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:service) { build(:service_with_image) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}
      it "index_image should return nil" do
        expect(service_presenter.sidebar_image).to eq(image_tag(service.image.index, title: service.name, alt: service.name))
      end

      it "show_image should return nil" do
        expect(service_presenter.overview_image).to eq(image_tag(service.image.show, title: service.name, alt: service.name))
      end
    end
  end
end
