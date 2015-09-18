FactoryGirl.define do
  factory :article_category do
    sequence(:name) {|n| "Article Category #{ n }"}
    display true
  end

end
