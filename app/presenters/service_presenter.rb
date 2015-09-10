class ServicePresenter < BasePresenter
  presents :service

  def service_category
    service.service_category.name
  end

  def department
    service.department.name
  end

  def name
    service.name
  end

  def summary
    h.simple_format service.summary
  end

  def index_image
    image(:index)
  end

  def show_image
    image(:show)
  end

  private

  def image(version)
    h.image_tag service.image.url(version), title: name, alt: name if service.image?
  end
end
