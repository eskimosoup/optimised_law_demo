FactoryGirl.define do
  factory :service_category do
    department
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
    factory :service_category_with_image, traits: [:with_image]
    factory :service_category_with_leaflet, traits: [:with_leaflet]
  end

end
