FactoryGirl.define do
  factory :audience do
    sequence(:name) {|n| "Audience #{ n }" }
    summary "MyText"
    content "<p>MyText</p>"
    layout "basic"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :audience_with_image, traits: [:with_image]
  end

end
