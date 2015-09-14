class ArticlePresenter < BasePresenter

  presents :article

  delegate :title, to: :article

  def summary
    h.simple_format article.summary if article.summary
  end

  def content
    h.raw article.content if article.content
  end

  def index_image
    image(:index)
  end

  def show_image
    image(:show)
  end

  def date(format = :default)
    h.l article.date, format: format
  end

  private

  def image(version)
    h.image_tag article.image.url(version), title: title, alt: title if article.image?
  end

end