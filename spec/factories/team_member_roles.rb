FactoryGirl.define do
  factory :team_member_role do
    sequence(:name){|n| "Role #{ n }" }
    position 1
    display true
  end

end
