require 'rails_helper'
# to get rid ofwarning: toplevel constant TeamMember referenced by Service::TeamMember
require Rails.root.join("app/models/service/team_member.rb")
RSpec.describe Service::TeamMember, type: :model do
  subject(:service_team_member) { build(:service_team_member)}
  describe "associations", :association do
    it { should belong_to(:service) }
    it { should belong_to(:team_member) }
  end
end
