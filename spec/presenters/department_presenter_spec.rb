require "rails_helper"

RSpec.describe DepartmentPresenter, type: :presenter do

  describe "standard department" do
    let(:department) { build(:department) }
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
    end

    describe "has image" do
      let(:department) { build(:department_with_image) }
      subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view)}
      it "index_image should return nil" do
        expect(department_presenter.index_image).to eq(image_tag(department.image.index, title: department.name, alt: department.name))
      end

      it "show_image should return nil" do
        expect(department_presenter.show_image).to eq(image_tag(department.image.show, title: department.name, alt: department.name))
      end
    end
  end
end
