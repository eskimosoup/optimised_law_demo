require "rails_helper"

RSpec.describe TeamMemberPresenter, type: :presenter do

  let(:team_member) { build(:team_member) }
  subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

  describe "delegations", :delegation do
    it { should delegate_method(:forename).to(:team_member) }
    it { should delegate_method(:surname).to(:team_member) }
    it { should delegate_method(:role).to(:team_member).as(:team_member_role_name) }
  end

  describe "standard team member" do
    it "should return forename" do
      expect(team_member_presenter.forename).to eq(team_member.forename)
    end

    it "should return surname" do
      expect(team_member_presenter.surname).to eq(team_member.surname)
    end

    it "should return their name" do
      expect(team_member_presenter.name).to eq([team_member.forename, team_member.surname].join(" "))
    end

    it "should return their email in a mail to link" do
      expect(team_member_presenter.email).to eq(mail_to(team_member.email))
    end

    it "should return their role" do
      expect(team_member_presenter.role).to eq(team_member.team_member_role_name)
    end

    it "should return primary phone number" do
      expect(team_member_presenter.primary_phone_number).to eq(team_member.primary_phone_number)
    end

    it "should return secondary phone number" do
      expect(team_member_presenter.secondary_phone_number).to eq(team_member.secondary_phone_number)
    end

    it "should return mobile phone number" do
      expect(team_member_presenter.mobile_phone_number).to eq(team_member.mobile_phone_number)
    end
  end

  describe "missing data" do
    let(:team_member) { build(:team_member_missing_data) }
    subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

    it "should return nil for email" do
      expect(team_member_presenter.email).to eq(nil)
    end

    it "should return nil for primary phone number" do
      expect(team_member_presenter.primary_phone_number).to eq(nil)
    end

    it "should return nil for secondary phone number" do
      expect(team_member_presenter.secondary_phone_number).to eq(nil)
    end

    it "should return nil for mobile phone number" do
      expect(team_member_presenter.mobile_phone_number).to eq(nil)
    end

    it "should return nil for google plus" do
      expect(team_member_presenter.google_plus).to eq(nil)
    end

    it "should return nil for twitter" do
      expect(team_member_presenter.twitter).to eq(nil)
    end

    it "should return nil for linkedin" do
      expect(team_member_presenter.linkedin).to eq(nil)
    end

    it "should return nil for biography" do
      expect(team_member_presenter.biography).to eq(nil)
    end
  end
end
