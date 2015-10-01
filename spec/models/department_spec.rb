require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:audience) }
  end

  describe "associations", :association do
    it { should belong_to(:audience) }
    it { should have_many(:services).dependent(:destroy) }
  end
end
