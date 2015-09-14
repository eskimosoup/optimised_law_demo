FactoryGirl.define do
  factory :service do
    service_category
    parent_id nil
    sequence(:name) {|n| "Service #{ n }" }
    summary "MyString"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :service_with_image, traits: [:with_image]
  end
end
