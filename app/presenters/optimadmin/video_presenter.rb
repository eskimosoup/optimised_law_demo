module Optimadmin
  class VideoPresenter < Optimadmin::BasePresenter
    presents :video

    def id
      video.id
    end

    def title
      #video.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.raw video.summary
    end
  end
end
