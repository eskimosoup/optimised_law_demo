module Optimadmin
  class ArticleCategoryPresenter < Optimadmin::BasePresenter
    presents :article_category

    delegate :name, to: :article_category

    def id
      article_category.id
    end
  end
end
