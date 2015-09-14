require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
  end

  describe "associations", :association do
    it { should have_many(:service_categories).dependent(:destroy) }
  end

  describe "friendly_id" do
    subject(:department) { build(:department) }

    it "creates a slug if title changed" do
      department.name = "My new title"
      expect(department.should_generate_new_friendly_id?).to be true
    end

    it "creates a slug if suggested_url changed" do
      department.suggested_url = "my-new-titled-department"
      expect(department.should_generate_new_friendly_id?).to be true
    end

    it "does not create slug when other attributes changed" do
      department = create(:department)
      department.content = "Gobbledegook"
      expect(department.should_generate_new_friendly_id?).to be false
    end
  end
end
