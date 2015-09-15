class TeamMember::Testimonial < ActiveRecord::Base
  belongs_to :team_member
  belongs_to :testimonial
end
