FactoryGirl.define do
  factory :office_location, class: 'Office::Location' do
    sequence(:name) {|n| "Location #{ n }"}
    display true
  end
end
