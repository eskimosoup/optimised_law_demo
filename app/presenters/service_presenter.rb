class ServicePresenter < BasePresenter
  presents :service
  delegate :has_people_helped_widget, to: :service

  def department
    service.department
  end

  def department_name
    department.name
  end

  def audience
    service.audience.name
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
    h.link_to "More on #{name}", h.service_path(service), class: 'service-overview-read-more' if Rails.env.development? || Rails.env.test? || service.name == 'Divorce'
  end

  def tab_link
    h.link_to service.name, "##{slug}", class: "service-tab tab-toggle"
  end

  def first_service?
    service == service.department.services.first
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

  def layout
    service.layout.present? ? service.layout : 'default'
  end
end
