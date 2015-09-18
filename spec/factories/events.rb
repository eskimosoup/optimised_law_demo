FactoryGirl.define do
  factory :event do
    event_category
    event_location
    start_date_time "2015-09-18 08:04:47"
    end_date_time "2015-09-18 08:05:47"
    booking_link "MyString"
    booking_information "MyString"
    title "Event"
    summary "MyText"
    content "<p>MyText</p>"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :event_with_image, traits: [:with_image]
  end
end
