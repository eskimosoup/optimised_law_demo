module Optimadmin
  class OfficePresenter < Optimadmin::BasePresenter
    presents :office

    def id
      office.id
    end

    def title
      office.name
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw office.details
    end
  end
end
