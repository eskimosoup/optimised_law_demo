require 'rails_helper'

RSpec.describe ServiceTestimonial, type: :model do
  describe "validations", :validation do
    it { should belong_to(:service) }
    it { should belong_to(:testimonial) }
  end
end
