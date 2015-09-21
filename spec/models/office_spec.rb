require 'rails_helper'

RSpec.describe Office, type: :model do

  subject(:office) { build(:office) }

  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:office_location_id) }
    it { should validate_presence_of(:office_location) }
    it { should validate_presence_of(:postcode) }
  end

  describe "associations", :association do
    it { should belong_to(:office_location) }
    it { should have_many(:service_offices).dependent(:destroy) }
    it { should have_many(:services).through(:service_offices) }
    it { should have_many(:team_member_offices).dependent(:destroy) }
    it { should have_many(:team_members).through(:team_member_offices) }
  end

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:office_location).with_prefix }
  end

end
