module Optimadmin
  class AwardPresenter < Optimadmin::BasePresenter
    presents :award

    def id
      award.id
    end

    def title
      award.name
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.raw award.summary
    end
  end
end
