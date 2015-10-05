class DepartmentPresenter < BasePresenter
  presents :department

  delegate :name, to: :department

  def sub_heading
    department.sub_heading
  end

  def summary
    h.raw department.summary
  end

  def index_image
    image(:index)
  end

  def show_image
    image(:show)
  end

  def services
    department.services.order(:name)
  end

  def leaflet_download
    h.link_to 'Download a Leaflet', department.leaflet.url if department.leaflet?
  end

  private

  def image(version)
    h.image_tag department.image.url(version), title: name, alt: name if department.image?
  end
end
