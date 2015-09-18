FactoryGirl.define do
  factory :team_member_event, :class => 'TeamMember::Event' do
    team_member
    event
  end

end
