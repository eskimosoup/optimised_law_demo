require "rails_helper"

RSpec.describe ArticlePresenter, type: :presenter do
  describe "standard article" do
    let(:article) { build(:article) }
    let(:team_member) { build(:team_member) }
    subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view)}

    describe "delegations", :delegation do
      it { should delegate_method(:id).to(:article) }
    end

    it "returns the name" do
      expect(article_presenter.title).to eq(article.title)
    end

    it "returns the red more link" do
      expect(article_presenter.read_more).to eq(link_to 'Read more', article, class: 'activity-stream-read-more ', title: 'Read more')
    end

    it "returns the linked team member name" do
      #link = "by #{link_to [article.team_member.forename, article.team_member.surname].join(' '), article.team_member}"
      link = "by " + [article.team_member.forename, article.team_member.surname].join(' ')
      expect(article_presenter.linked_team_member).to eq(link)
    end

    it "returns the linked article category name" do
      #link = "in #{link_to article.article_category.name, article.article_category}"
      link = "in #{article.article_category.name}"
      expect(article_presenter.linked_article_category).to eq(link)
    end

    it "returns the article category name" do
      expect(article_presenter.article_category_name).to eq(article.article_category.name)
    end

    it "returns the article category" do
      expect(article_presenter.article_category).to eq(article.article_category)
    end

    it "returns the summary" do
      expect(article_presenter.summary).to eq(simple_format(article.summary))
    end

    it "returns the content" do
      expect(article_presenter.content).to eq(raw(article.content))
    end

    describe "date formatting" do
      it "should return the date with default format" do
        expect(article_presenter.date).to eq(l article.date, format: :default)
      end

      it "should return the date with short format" do
        expect(article_presenter.date(:short)).to eq(l article.date, format: :short)
      end

      it "should return the date with long format" do
        expect(article_presenter.date(:long)).to eq(l article.date, format: :long)
      end
    end
  end

  describe "images" do
    describe "no image" do
      let(:article) { build(:article) }
      subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view)}
      it "index_image should return nil" do
        expect(article_presenter.index_image).to eq(nil)
      end

      it "show_image should return nil" do
        expect(article_presenter.show_image).to eq(nil)
      end

      it "activity_stream_image should return nil" do
        expect(article_presenter.activity_stream_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:article) { build(:article_with_image) }
      subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view)}
      it "index_image should return nil" do
        expect(article_presenter.index_image).to eq(image_tag(article.image.index, title: article.title, alt: article.title))
      end

      it "show_image should return nil" do
        expect(article_presenter.show_image).to eq(image_tag(article.image.show, title: article.title, alt: article.title))
      end

      it "activity_stream_image should not return nil" do
        expect(article_presenter.activity_stream_image).to eq(image_tag(article.image.activity_stream, title: article.title, alt: article.title))
      end
    end
  end

end
