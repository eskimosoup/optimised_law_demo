require 'rails_helper'

RSpec.describe ServiceCategory, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:department) }
  end

  describe "associations", :association do
    it { should belong_to(:department) }
    it { should have_many(:services).dependent(:destroy) }
  end
end
