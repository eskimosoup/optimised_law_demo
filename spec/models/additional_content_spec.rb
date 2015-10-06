require 'rails_helper'

RSpec.describe AdditionalContent, type: :model do
  describe "validations", :validation do
    subject(:additional_content) { build(:additional_content) }
    it { should validate_presence_of(:content) }
    it { should validate_uniqueness_of(:area) }
  end

  describe "scopes", :scope do
    let(:additional_content) { create(:additional_content) }
    let(:hidden_additional_content) { create(:additional_content, display: false) }

    it 'only returns displayed' do
      expect(AdditionalContent.displayed).not_to include hidden_additional_content
    end
  end
end
