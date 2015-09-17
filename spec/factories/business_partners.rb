FactoryGirl.define do
  factory :business_partner do
    position 1
    name "MyString"
    trait :with_link do
      link "http://www.google.co.uk"
    end
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    display true
    factory :business_partner_with_link, traits: [:with_link]
  end

end
