require 'rails_helper'

RSpec.describe Audience, type: :model do
  describe "validations", :validation do
    subject(:audience) { build(:audience) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:colour) }
    it { should validate_inclusion_of(:colour).in_array(Audience::COLOURS) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive }
  end

  describe "associations", :association do
    it { should have_many(:departments).dependent(:destroy) }
  end

  describe "friendly_id" do
    subject(:audience) { build(:audience) }

    it "creates a slug if title changed" do
      audience.name = "My new title"
      expect(audience.should_generate_new_friendly_id?).to be true
    end

    it "creates a slug if suggested_url changed" do
      audience.suggested_url = "my-new-titled-audience"
      expect(audience.should_generate_new_friendly_id?).to be true
    end

    it "does not create slug when other attributes changed" do
      audience = create(:audience)
      audience.content = "Gobbledegook"
      expect(audience.should_generate_new_friendly_id?).to be false
    end
  end
end
