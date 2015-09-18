require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  describe "validations", :validation do
    subject(:team_member) { build(:team_member) }
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "associations", :association do
    it { should belong_to(:team_member_role) }
    it { should have_many(:team_member_testimonials).dependent(:destroy) }
    it { should have_many(:testimonials).through(:team_member_testimonials) }
    it { should have_many(:articles).dependent(:nullify) }
    it { should have_many(:service_team_members).dependent(:destroy) }
    it { should have_many(:services).through(:service_team_members) }
  end

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:team_member_role).with_prefix }
  end

  describe "friendly_id" do
    subject(:team_member) { build(:team_member) }

    it "creates a slug if forename changed" do
      team_member.forename = "Bob"
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it "creates a slug if surname changed" do
      team_member.forename = "Jones"
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it "creates a slug if suggested_url changed" do
      team_member.suggested_url = "my-new-titled-team_member"
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it "does not create slug when other attributes changed" do
      team_member = create(:team_member)
      team_member.biography = "Gobbledegook"
      expect(team_member.should_generate_new_friendly_id?).to be false
    end
  end
end
