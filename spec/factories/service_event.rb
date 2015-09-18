FactoryGirl.define do
  factory :service_event, :class => 'Service::Event' do
    service
    event
  end

end
