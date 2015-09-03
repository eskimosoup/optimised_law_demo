FactoryGirl.define do
  factory :service do
    service_category
    parent_id nil
    sequence(:name) {|n| "Service #{ n }" }
    image "MyString"
    summary "<p>MyString</p>"
    display true
  end

end
