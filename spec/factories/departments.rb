FactoryGirl.define do
  factory :department do
    audience
    sequence(:name) {|n| "Service #{ n }" }
    sub_heading "Sub heading"
    summary "Service summary"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    trait :with_leaflet do
      leaflet { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :department_with_image, traits: [:with_image]
    factory :department_with_leaflet, traits: [:with_leaflet]
  end
end
FactoryGirl.define do
  factory :department_with_service, parent: :department do |listing|
    services { build_list :service_with_team_members, 3 }
  end
end
