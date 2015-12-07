require 'rails_helper'
#  rspec --tag 'download_category'
RSpec.describe DownloadCategory, type: :model, download_category: true do
  describe 'validations', :validation do
    subject(:download_category) { build(:download_category) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations', :association do
    it { should have_many(:downloads).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:download_category) { create(:download_category) }
    let(:hidden_download_category) { create(:download_category, display: false) }

    it 'only returns displayed' do
      expect(DownloadCategory.displayed).not_to include hidden_download_category
    end
  end
end
