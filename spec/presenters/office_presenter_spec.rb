require "rails_helper"

RSpec.describe OfficePresenter, type: :presenter do
  let(:office) { build(:office) }
  subject(:office_presenter) { OfficePresenter.new(object: office, view_template: view) }

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:office) }
    it { should delegate_method(:building_name).to(:office) }
    it { should delegate_method(:building_number).to(:office) }
    it { should delegate_method(:street).to(:office) }
    it { should delegate_method(:town).to(:office) }
    it { should delegate_method(:county).to(:office) }
    it { should delegate_method(:postcode).to(:office) }
    it { should delegate_method(:fax_number).to(:office) }
    it { should delegate_method(:dx_number).to(:office) }
    it { should delegate_method(:office_location_name).to(:office) }
  end

  describe "escaping html" do
    describe "details present" do
      it "should escape the html when accessing details" do
        expect(office_presenter.details).to eq(raw(office.details))
      end
    end

    describe "details nil" do
      let(:office) { build(:office, details: nil) }
      subject(:office_presenter) { OfficePresenter.new(object: office, view_template: view) }
      it "should escape the html when accessing details" do
        expect(office_presenter.details).to eq(nil)
      end
    end
  end

  describe "email links" do
    describe "office email is nil" do
      let(:office) { build(:office, email: nil) }
      subject(:office_presenter) { OfficePresenter.new(object: office, view_template: view) }

      it "should return nil for email" do
        expect(office_presenter.email).to eq(nil)
      end
    end

    describe "office has email" do
      it "should return a mailto link" do
        expect(office_presenter.email).to eq(mail_to(office.email))
      end
    end
  end

  describe "images" do
    describe "no image" do
      let(:office) { build(:office) }
      subject(:office_presenter) { OfficePresenter.new(object: office, view_template: view)}
      it "index_image should return nil" do
        expect(office_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(office_presenter.show_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:office) { build(:office_with_image) }
      subject(:office_presenter) { OfficePresenter.new(object: office, view_template: view)}
      it "index_image should return image tag" do
        expect(office_presenter.index_image).to eq(image_tag(office.image.index))
      end

      it "show_image should return image tag" do
        expect(office_presenter.show_image).to eq(image_tag(office.image.show))
      end
    end
  end
end