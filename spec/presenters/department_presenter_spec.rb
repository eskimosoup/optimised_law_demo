require "rails_helper"

RSpec.describe DepartmentPresenter, type: :presenter do

  describe "standard department" do
    let(:department) { build(:department) }
    subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view)}

    it "returns the name" do
      expect(department_presenter.name).to eq(department.name)
    end

    it "returns the layout" do
      expect(department_presenter.layout).to eq(department.layout)
    end

    it "returns the summary - html escaped" do
      content = simple_format(department.summary)
      expect(department_presenter.summary).to eq(content)
    end

    it "returns the content - html escaped" do
      content = raw(department.content)
      expect(department_presenter.content).to eq(content)
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
