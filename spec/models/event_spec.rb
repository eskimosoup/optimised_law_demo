require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:start_date_time) }
    it { should validate_presence_of(:end_date_time) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank }
  end

  describe "associations", :association do
    it { should belong_to(:event_category).class_name("Event::Category") }
    it { should belong_to(:event_location).class_name("Event::Location") }
    it { should have_many(:event_team_members).class_name("TeamMember::Event").dependent(:nullify) }
    it { should have_many(:team_members).through(:event_team_members) }
    it { should have_many(:service_events).class_name("Service::Event").dependent(:nullify) }
    it { should have_many(:events).through(:service_events) }
  end

  describe "friendly_id" do
    subject(:event) { build(:event) }

    it "creates a slug if title changed" do
      event.title = "My new title"
      expect(article.should_generate_new_friendly_id?).to be true
    end

    it "creates a slug if suggested_url changed" do
      event.suggested_url = "my-new-titled-event"
      expect(event.should_generate_new_friendly_id?).to be true
    end

    it "does not create slug when other attributes changed" do
      event = create(:event)
      event.content = "Gobbledegook"
      expect(event.should_generate_new_friendly_id?).to be false
    end
  end
end
