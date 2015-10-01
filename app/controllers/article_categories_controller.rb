class ArticleCategoriesController < ApplicationController

  before_action :set_article_categories

  def index

  end

  def show

  end

  private

  def set_article_categories
    @presented_article_categories = BaseCollectionPresenter.new(objects: ArticleCategory.displayed,
                                                                view_template: view_context, presenter: ArticleCategoryPresenter)
  end

end