class ArticleCategoryPresenter < BasePresenter
  presents :article_category

  delegate :name, to: :article_category

  def filter_link
    h.link_to name, h.articles_path(category: name)
  end
end