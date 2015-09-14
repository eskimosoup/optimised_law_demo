FactoryGirl.define do
  factory :article_category, class: 'Article::Category' do
    sequence(:name) {|n| "Article Category #{ n }"}
    display true
  end

end
