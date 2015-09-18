FactoryGirl.define do
  factory :event_category, class: 'Event::Category' do
    sequence(:name) {|n| "Event Category #{ n }"}
    display true
  end

end
