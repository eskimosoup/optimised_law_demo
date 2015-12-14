class AudiencePresenter < BasePresenter
  presents :audience

  delegate :name, :colour, :sub_heading, :layout, to: :audience

  def class_name
    "audience-#{colour}"
  end

  def summary
    h.simple_format audience.summary
  end

  def content
    h.raw audience.content
  end

  def index_image
    image(:index)
  end

  def show_image
    image(:show)
  end

  def departments
    audience.departments.order(:name)
  end

  private

  def image(version)
    h.image_tag audience.image.url(version), title: name, alt: name if audience.image?
  end
end
