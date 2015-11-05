require "rails_helper"

RSpec.describe DepartmentPresenter, type: :presenter do

  describe "standard department" do
    let(:department) { create(:department) }
    subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view)}

    it "returns the sub heading" do
      expect(department_presenter.sub_heading).to eq(department.sub_heading)
    end

    it "returns the name" do
      expect(department_presenter.name).to eq(department.name)
    end

    it "returns the summary - html escaped" do
      content = raw(department.summary)
      expect(department_presenter.summary).to eq(content)
    end

    it "returns the services" do
      expect(department_presenter.services).to eq(department.services)
    end

    it "returns the tab link" do
      expect(department_presenter.tab_link).to eq(link_to department.name, "##{department.slug}", class: 'service-overview-title-block')
    end

    it "returns no department head" do
      expect(department_presenter.department_head).to eq(nil)
    end
  end

  describe "no department head testing" do
    let(:department) { create(:department_with_service) }
    subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view)}

    it "returns department head" do
      expect(department_presenter.department_head).to eq(link_to (image_tag department.services.first.team_members.first.image.small, class: 'team-members-service-overview-avatar'), view.service_path(department.services.first, anchor: 'team-members-carousel'), class: 'team-members-link', id: 'team-members')
    end
  end

  describe "leaflet testing" do
    describe "no leaflet" do
      let(:department) { build(:department) }
      subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view)}

      it "leaflet should return nil" do
        expect(department_presenter.leaflet_download).to eq(nil)
      end
    end

    describe "has leaflet" do
      let(:department) { build(:department_with_leaflet) }
      subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view)}

      it "leaflet should return nil" do
        expect(department_presenter.leaflet_download).to eq(link_to 'Download a Leaflet', department.leaflet.url)
      end
    end
  end

  describe "image testing" do
    describe "no image" do
      let(:department) { build(:department) }
      subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view)}
      it "index_image should return nil" do
        expect(department_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(department_presenter.show_image).to eq(nil)
      end

      it "overview_image should return nil" do
        expect(department_presenter.overview_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:department) { build(:department_with_image) }
      subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view)}
      it "index_image should return nil" do
        expect(department_presenter.index_image).to eq(image_tag(department.image.index))
      end

      it "overview_image should return nil" do
        expect(department_presenter.overview_image).to eq(image_tag(department.image.show, alt: department.name, class: 'hide-for-medium-down'))
      end

      it "show_image should return nil" do
        expect(department_presenter.show_image(alt: department.name)).to eq(image_tag(department.image.show, alt: department.name))
      end
    end
  end
end
