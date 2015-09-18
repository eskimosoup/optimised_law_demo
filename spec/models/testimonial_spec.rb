require 'rails_helper'

RSpec.describe Testimonial, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:recommendation) }
  end

  describe "associations", :association do
    it { should have_many(:service_testimonials).dependent(:destroy) }
    it { should have_many(:services).through(:service_testimonials) }
    it { should have_many(:team_member_testimonials).dependent(:destroy) }
    it { should have_many(:team_members).through(:team_member_testimonials) }
  end
end
