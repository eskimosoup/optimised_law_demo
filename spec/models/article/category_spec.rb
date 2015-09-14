require 'rails_helper'

RSpec.describe Article::Category, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations", :association do
    it { should have_many(:articles).with_foreign_key(:article_category_id).dependent(:nullify) }
  end
end
