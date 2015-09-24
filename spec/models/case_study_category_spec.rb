require 'rails_helper'

RSpec.describe CaseStudyCategory, type: :model do
  describe "validations", :validation do
    subject(:case_study_category) { create(:case_study_category) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive }
  end

  describe "associations", :association do
    it { should have_many(:case_studies).dependent(:nullify) }
  end

  describe "friendly_id" do
    subject(:case_study_category) { build(:case_study_category) }

    it "creates a slug if title changed" do
      case_study_category.name = "My new title"
      expect(case_study_category.should_generate_new_friendly_id?).to be true
    end

    it "creates a slug if suggested_url changed" do
      case_study_category.suggested_url = "my-new-titled-case_study-category"
      expect(case_study_category.should_generate_new_friendly_id?).to be true
    end
  end
end
