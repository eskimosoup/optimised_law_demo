require 'rails_helper'

RSpec.describe Award, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:award_type) }
    it { should validate_presence_of(:image) }
    it { should validate_inclusion_of(:award_type).in_array(%w( award accreditation )) }
  end

  describe "associations", :association do
    it { should have_many(:service_awards) }
    it { should have_many(:services).through(:service_awards) }
  end

  # may be best not to do this for everything, but thought I'd test
  describe "scopes", :scope do
    let(:award) { create(:award) }
    let(:hidden_award) { create(:award, display: false) }

    it 'only returns displayed' do
      expect(Award.displayed).not_to include hidden_award
    end
  end
end
