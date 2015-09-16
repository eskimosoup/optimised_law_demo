FactoryGirl.define do
  factory :service_related_service, :class => 'Service::RelatedService' do
    service nil
related_service nil
position 1
  end

end
