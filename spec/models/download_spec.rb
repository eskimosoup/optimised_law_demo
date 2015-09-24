require 'rails_helper'

RSpec.describe Download, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:file) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:service_ids) }
  end

  describe "associations", :association do
    it { should have_many(:service_downloads).dependent(:destroy) }
    it { should have_many(:services).through(:service_downloads) }
  end
end
