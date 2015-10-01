module Optimadmin
  class AudiencePresenter < Optimadmin::BasePresenter
    presents :audience

    def name
      audience.name
    end

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.raw audience.summary
    end
  end
end
