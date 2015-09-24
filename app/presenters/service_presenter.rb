class ServicePresenter < BasePresenter
  presents :service

  def service_category
    service.service_category
  end

  def service_category_name
    service_category.name
  end

  def department
    service.department.name
  end

  def name
    service.name
  end

  def slug
    service.slug
  end

  def summary
    h.raw service.summary
  end

  def content
    h.raw service.content
  end

  def overview_image
    show_image(alt: name, class: 'hide-for-medium-down')
  end

  def read_more_link
    h.link_to "More on #{name}", h.service_path(service), class: 'service-overview-read-more'
  end

  def tab_link
    h.link_to service.name, "##{slug}", class: "tab-toggle#{" active" if first_service?}"
  end

  def first_service?
    service == service.service_category.services.first
  end

  def related_services
    service.related_services
  end

  def has_related_services?
    true if service.related_services.present?
  end

  def leaflet_download
    h.link_to 'Download a Leaflet', service.leaflet.url if service.leaflet?
  end
end
