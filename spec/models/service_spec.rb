require 'rails_helper'

RSpec.describe Service, type: :model, service: true do
  describe "validations", :validation do
    subject(:service) { build(:service) }
    it { should validate_presence_of(:name) }
    it { should validate_inclusion_of(:layout).in_array(Service::LAYOUTS).allow_blank }
    it { should validate_presence_of(:department_id) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive }
  end

  describe "associations", :association do
    it { should belong_to(:department) }
    it { should belong_to(:featured_download) }
    it { should have_one(:audience).through(:department) }
    it { should have_many(:service_testimonials).dependent(:destroy) }
    it { should have_many(:testimonials).through(:service_testimonials) }
    it { should have_many(:pages).dependent(:nullify) }
    it { should have_many(:service_team_members).dependent(:destroy) }
    it { should have_many(:team_members).through(:service_team_members) }
    it { should have_many(:service_offices).dependent(:destroy) }
    it { should have_many(:offices).through(:service_offices) }
    it { should have_many(:service_events).dependent(:destroy) }
    it { should have_many(:events).through(:service_events) }
    it { should have_many(:service_related_services).dependent(:destroy) }
    it { should have_many(:related_services).through(:service_related_services) }
    it { should have_many(:inverse_service_related_services).class_name("ServiceRelatedService").with_foreign_key(:related_service_id).dependent(:destroy) }
    it { should have_many(:inverse_related_services).through(:inverse_service_related_services).source(:service) }
    it { should have_many(:service_videos).dependent(:destroy) }
    it { should have_many(:videos).through(:service_videos) }
    it { should have_many(:service_downloads).dependent(:destroy) }
    it { should have_many(:downloads).through(:service_downloads) }
    it { should have_many(:videos).through(:service_videos) }
    it { should have_many(:service_case_studies).dependent(:destroy) }
    it { should have_many(:case_studies).through(:service_case_studies) }
    it { should have_many(:service_awards).dependent(:nullify) }
    it { should have_many(:awards).through(:service_awards) }
    it { should have_many(:service_articles).dependent(:destroy) }
    it { should have_many(:articles).through(:service_articles) }
    it { should have_many(:service_faqs).dependent(:destroy) }
    it { should have_many(:frequently_asked_questions).through(:service_faqs) }
  end

  describe "friendly_id" do
    subject(:service) { build(:service) }

    it "creates a slug if name changed" do
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
