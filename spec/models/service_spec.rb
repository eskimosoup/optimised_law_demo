require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
  end

  describe "associations", :association do
    it { should belong_to(:service_category) }
    it { should have_one(:department).through(:service_category) }
    it "should have_many(:testimonials)"
    it "should have_many(:service_pages)"
    it "should have_many(:team_members)"
    it "should have_many(:related_services)"
  end

  describe "friendly_id" do
    subject(:service) { build(:service) }

    it "creates a slug if title changed" do
      service.name = "My new title"
      expect(service.should_generate_new_friendly_id?).to be true
    end

    it "creates a slug if suggested_url changed" do
      service.suggested_url = "my-new-titled-service"
      expect(service.should_generate_new_friendly_id?).to be true
    end

    it "does not create slug when other attributes changed" do
      service = create(:service)
      service.summary = "Gobbledegook"
      expect(service.should_generate_new_friendly_id?).to be false
    end
  end
end
