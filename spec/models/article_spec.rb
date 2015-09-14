require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:date) }
  end

  describe "associations", :association do
    it { should belong_to(:article_category).class_name("Article::Category") }
    it "should have_many(:team_members)"
    it "should have_many(:offices)"
  end

end
