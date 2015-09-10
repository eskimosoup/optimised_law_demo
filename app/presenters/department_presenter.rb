class DepartmentPresenter < BasePresenter
  presents :department

  delegate :name, :layout, to: :department

  def summary
    h.simple_format department.summary
  end

  def content
    h.raw department.content
  end

  def index_image
    image(:index)
  end

  def show_image
    image(:show)
  end

  def service_categories
    department.service_categories
  end

  private

  def image(version)
    h.image_tag department.image.url(version), title: name, alt: name if department.image?
  end
end
