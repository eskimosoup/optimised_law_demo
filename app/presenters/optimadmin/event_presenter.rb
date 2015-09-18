module Optimadmin
  class EventPresenter < Optimadmin::BasePresenter
    presents :event

    def id
      event.id
    end

    def title
      event.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw event.summary
    end
  end
end
