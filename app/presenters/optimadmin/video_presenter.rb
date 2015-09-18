module Optimadmin
  class VideoPresenter < Optimadmin::BasePresenter
    presents :video

    def id
      video.id
    end

    def title
      video.name
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw video.youtube_embed_code
    end
  end
end
