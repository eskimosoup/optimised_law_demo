class TeamMemberEvent < ActiveRecord::Base
  belongs_to :team_member
  belongs_to :event
end
