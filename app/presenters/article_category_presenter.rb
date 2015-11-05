class ArticleCategoryPresenter < BasePresenter
  presents :article_category

  delegate :name, to: :article_category

  def filter_link
    begin
      h.link_to name, h.articles_path(category: name)
    rescue
      h.content_tag :span, name, class: 'invalid-link'
    end
  end
end
