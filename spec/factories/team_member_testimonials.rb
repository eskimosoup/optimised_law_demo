FactoryGirl.define do
  factory :team_member_testimonial, :class => 'TeamMember::Testimonial' do
    team_member
    testimonial
  end

end
