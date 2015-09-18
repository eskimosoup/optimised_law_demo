module Optimadmin
  class VideoCategoryPresenter < Optimadmin::BasePresenter
    presents :video_category

    delegate :name, to: :video_category

    def id
      video_category.id
    end

    def title
      #video_category.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.raw video_category.summary
    end
  end
end
