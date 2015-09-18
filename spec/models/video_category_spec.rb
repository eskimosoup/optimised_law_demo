require 'rails_helper'

RSpec.describe VideoCategory, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations", :association do
    it { should have_many(:videos).dependent(:destroy) }
  end
end
