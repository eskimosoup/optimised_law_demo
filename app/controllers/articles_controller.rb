class ArticlesController < ApplicationController

  def index
    articles = Article.displayed.for_category(params[:category]).page(params[:page]).per(10)
    @presented_articles = BaseCollectionPresenter.new(collection: , view_template: view_context,
                                                      presenter: ArticlePresenter)
    @presented_article_categories = BaseCollectionPresenter.new(collection: ArticleCategory.displayed, view_template: view_context,
                                                                presenter: ArticleCategoryPresenter)
  end

  def show
    article = Article.displayed.friendly.find(params[:id])
    redirect_to article, status: :moved_permanently if request.path != article_path(article)
    @presented_article = ArticlePresenter.new(object: article, view_template: view_context)
  end
end