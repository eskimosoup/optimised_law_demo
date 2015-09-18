require 'rails_helper'

RSpec.describe Event::Location, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address_line_1) }
    it { should validate_presence_of(:town) }
    it { should validate_presence_of(:postcode) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations", :association do
    it { should have_many(:events).with_foreign_key(:event_location_id).dependent(:nullify) }
  end
end
