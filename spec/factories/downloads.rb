FactoryGirl.define do
  factory :download do
    title "MyString"
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    summary "MyString"
    file { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    display true

    after(:build) do |download|
      download.services = build_list(:service, 3)
    end
  end
end
