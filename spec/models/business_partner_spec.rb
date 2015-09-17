require 'rails_helper'

RSpec.describe BusinessPartner, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image) }
  end
end
