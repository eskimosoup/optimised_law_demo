module Optimadmin
  class ServicePresenter < Optimadmin::BasePresenter
    presents :service

    def id
      service.id
    end

    def name
      service.name
    end

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def reorder_related_services_link
      return nil if service.related_services.count <= 1
      h.link_to "Reorder #{ h.pluralize service.related_services.count, "Related Service" }", h.service_related_services_path(service)
    end

    def optimadmin_summary
      h.simple_format service.summary
    end
  end
end
