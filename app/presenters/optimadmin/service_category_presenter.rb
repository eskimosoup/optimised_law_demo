module Optimadmin
  class ServiceCategoryPresenter < Optimadmin::BasePresenter
    presents :service_category

    def id
      service_category.id
    end

    def name
      service_category.name
    end

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.simple_format service_category.summary
    end
  end
end
