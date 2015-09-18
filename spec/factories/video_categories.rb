FactoryGirl.define do
  factory :video_category do
    sequence(:name){|n| "Category #{ n }" }
    display true
  end

end
