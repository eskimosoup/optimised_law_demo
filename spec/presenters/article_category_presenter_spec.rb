require "rails_helper"

RSpec.describe ArticleCategoryPresenter, type: :presenter do
  let(:article_category) { build(:article_category) }
  subject(:article_category_presenter) { ArticleCategoryPresenter.new(object: article_category, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:article_category) }
  end

  describe "standard article category" do
    it "returns the name" do
      expect(article_category_presenter.name).to eq(article_category.name)
    end
  end
end
