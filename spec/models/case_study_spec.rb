require 'rails_helper'

RSpec.describe CaseStudy, type: :model do

  describe "validations", :validation do
    subject(:case_study) { build(:case_study) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:case_study_category_id) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:case_study_category_id) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive }
  end

  describe "associations", :association do
    it { should belong_to(:case_study_category) }
    it { should have_many(:service_case_studies).dependent(:destroy) }
    it { should have_many(:services).through(:service_case_studies) }
  end

  describe "friendly_id" do
    subject(:case_study) { build(:case_study) }
    it "creates a slug if title changed" do
      case_study.title = "My new title"
      expect(case_study.should_generate_new_friendly_id?).to be true
    end

    it "creates a slug if suggested_url changed" do
      case_study.suggested_url = "my-new-titled-case-study"
      expect(case_study.should_generate_new_friendly_id?).to be true
    end

    it "does not create slug when other attributes changed" do
      case_study = create(:case_study)
      case_study.content = "Gobbledegook"
      expect(case_study.should_generate_new_friendly_id?).to be false
    end
  end
end
