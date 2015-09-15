FactoryGirl.define do
  factory :team_member do
    forename "MyString"
    surname "MyString"
    team_member_role
    sequence(:email) {|n| "myemail#{ n }@example.com"}
    primary_phone_number "MyString"
    secondary_phone_number "MyString"
    mobile_phone_number "MyString"
    google_plus "MyString"
    twitter "MyString"
    linkedin "MyString"
    biography "MyText"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :team_member_with_image, traits: [:with_image]
  end

  factory :team_member_missing_data, class: TeamMember do
    forename "MyString"
    surname "MyString"
    team_member_role
    display true
  end
end
