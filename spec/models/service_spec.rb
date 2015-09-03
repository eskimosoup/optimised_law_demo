require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
  end

  describe "associations", :association do
    it { should belong_to(:service_category) }
    it { should have_one(:department).through(:service_category) }
    it "should have_many(:testimonials)"
    it "should have_many(:service_pages)"
    it "should have_many(:team_members)"
    it "should have_many(:related_services)"
  end
end
