require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations", :association do
    it { should have_many(:articles).dependent(:nullify) }
  end
end
