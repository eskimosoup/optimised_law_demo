require 'rails_helper'

RSpec.describe Service::RelatedService, type: :model do
  describe "validations", :validation do
    it { should belong_to(:service) }
    it { should belong_to(:related_service).class_name("Service") }

  end
end
