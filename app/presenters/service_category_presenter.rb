class ServiceCategoryPresenter < BasePresenter
  presents :service_category

  delegate :name, to: :service_category

  def sub_heading
    service_category.sub_heading
  end

  def summary
    h.raw service_category.summary
  end

  def index_image
    image(:index)
  end

  def show_image
    image(:show)
  end

  def services
    service_category.services
  end

  def leaflet_download
    h.link_to 'Download a Leaflet', service_category.leaflet.url if service_category.leaflet?
  end

  private

  def image(version)
    h.image_tag service_category.image.url(version), title: name, alt: name if service_category.image?
  end
end
