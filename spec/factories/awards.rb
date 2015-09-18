FactoryGirl.define do
  factory :award do
    position 1
    name "Award"
    trait :with_link do
      link "http://www.google.co.uk"
    end
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    award_type "award"
    display true
    factory :award_with_link, traits: [:with_link]
  end

  factory :accreditation do
    position 2
    name "Accreditation"
    trait :with_link do
      link "http://www.google.co.uk"
    end
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    award_type "award"
    display true
    factory :accreditation_with_link, traits: [:accreditation_with_link]
  end

  factory :hidden_accreditation do
    position 2
    name "Accreditation"
    trait :with_link do
      link "http://www.google.co.uk"
    end
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    display true
    award_type "award"
  end
end
