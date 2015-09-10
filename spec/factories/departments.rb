FactoryGirl.define do
  factory :department do
    sequence(:name) {|n| "Department #{ n }" }
    summary "MyText"
    content "<p>MyText</p>"
    layout "basic"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :department_with_image, traits: [:with_image]
  end

end
