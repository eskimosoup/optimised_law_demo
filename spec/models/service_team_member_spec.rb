require 'rails_helper'

RSpec.describe ServiceTeamMember, type: :model do
  subject(:service_team_member) { build(:service_team_member)}
  describe "associations", :association do
    it { should belong_to(:service) }
    it { should belong_to(:team_member) }
  end
end
