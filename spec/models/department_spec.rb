require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
  end
end
