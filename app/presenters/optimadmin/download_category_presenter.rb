module Optimadmin
  class DownloadCategoryPresenter < Optimadmin::BasePresenter
    presents :download_category
    delegate :id, to: :download_category

    def name
      if download_category.homepage_highlight.blank?
        download_category.name
      else
        h.content_tag :strong, download_category.name
      end
    end
  end
end
