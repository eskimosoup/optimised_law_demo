FactoryGirl.define do
  factory :case_study do
    title "Case study"
    summary "MyText"
    image ""
    content "<p>MyText</p>"
    date { Date.today }
    display true
    case_study_category
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :case_study_with_image, traits: [:with_image]
  end

end
