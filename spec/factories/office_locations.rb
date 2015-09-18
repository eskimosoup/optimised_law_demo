FactoryGirl.define do
  factory :office_location do
    sequence(:name) {|n| "Location #{ n }"}
    display true
  end
end
