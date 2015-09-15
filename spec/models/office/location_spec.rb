require 'rails_helper'

RSpec.describe Office::Location, type: :model do
   describe "validations", :validation do
     it { should validate_presence_of(:name) }
     it { should validate_uniqueness_of(:name) }
   end

  describe "associations", :association do
    it { should have_many(:offices).with_foreign_key(:office_location_id).dependent(:destroy) }
  end

   describe "friendly_id" do
     subject(:office_location) { build(:office_location) }

     it "creates a slug if name changed" do
       office_location.name = "My new name"
       expect(office_location.should_generate_new_friendly_id?).to be true
     end

     it "creates a slug if suggested_url changed" do
       office_location.suggested_url = "my-new-url"
       expect(office_location.should_generate_new_friendly_id?).to be true
     end
   end
end
