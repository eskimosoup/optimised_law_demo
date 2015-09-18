module Optimadmin
  class ServicePresenter < Optimadmin::BasePresenter
    presents :services

    def id
      service.id
    end

    def name
      service.name
    end

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.simple_format service.summary
    end
  end
end
