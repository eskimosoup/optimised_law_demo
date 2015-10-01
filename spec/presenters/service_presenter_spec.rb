require "rails_helper"

RSpec.describe ServicePresenter, type: :presenter do

  describe "standard service" do
    let(:service) { build(:service) }
    let(:department) { build(:department) }
    subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}

    it "returns the name" do
      expect(service_presenter.name).to eq(service.name)
    end

    it "returns the department" do
      expect(service_presenter.department).to eq(service.department)
    end

    it "returns the department name" do
      expect(service_presenter.department_name).to eq(service.department.name)
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
      expect(service_presenter.related_services).to eq(service.related_services)
    end

    it "returns a boolean whether service has related services" do
      expect(service_presenter.has_related_services?).to eq(nil)
    end

    #describe "has related services" do
    #  let(:service_with_related_service) { build(:service_with_related_service) }
    #  subject(:service_presenter) { ServicePresenter.new(object: service_with_related_service, view_template: view)}
    #  it "returns a boolean whether service has related services" do
    #    expect(service_presenter.has_related_services?).to eq(true)
    #  end
    #end

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

  describe "leaflet testing" do
    describe "no leaflet" do
      let(:service) { build(:service) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}

      it "leaflet should return nil" do
        expect(service_presenter.leaflet_download).to eq(nil)
      end
    end

    describe "has leaflet" do
      let(:service) { build(:service_with_leaflet) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}

      it "leaflet should return nil" do
        expect(service_presenter.leaflet_download).to eq(link_to 'Download a Leaflet', service.leaflet.url)
      end
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
        expect(service_presenter.overview_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:service) { build(:service_with_image) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view)}
      it "index_image should not return nil" do
        expect(service_presenter.index_image(alt: service.name)).to eq(image_tag(service.image.index, alt: service.name))
      end

      it "show_image should not return nil" do
        expect(service_presenter.overview_image).to eq(image_tag(service.image.show, alt: service.name, class: 'hide-for-medium-down'))
      end
    end
  end
end
