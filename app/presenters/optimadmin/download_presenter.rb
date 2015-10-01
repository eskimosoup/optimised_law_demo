module Optimadmin
  class DownloadPresenter < Optimadmin::BasePresenter
    presents :download
    delegate :title, to: :download

    def id
      download.id
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format download.summary
    end
  end
end
