class ServicePresenter < BasePresenter
  presents :service

  def articles
    service.articles
  end

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

  def sidebar_image
    image(:index)
  end

  def overview_image
    image(:show)
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
    service.service_category.services
  end

  private

  def image(version)
    h.image_tag service.image.url(version), title: name, alt: name if service.image?
  end
end
