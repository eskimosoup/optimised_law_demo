require 'rails_helper'

RSpec.describe Testimonial, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:recommendation) }
  end

  describe "associations", :association do
    it { should have_many(:service_testimonials).class_name("Service::Testimonial").dependent(:destroy) }
    it { should have_many(:services).through(:service_testimonials) }
  end
end
