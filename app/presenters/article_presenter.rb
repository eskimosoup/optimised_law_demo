class ArticlePresenter < BasePresenter

  presents :article

  delegate :title, to: :article

  def link
    article
  end

  def article_category
    article.article_category
  end

  def article_category_name
    article_category.name
  end

  def linked_article_category
    "in #{h.link_to article_category.name, article_category}" unless article_category.blank?
  end

  def linked_team_member
    "by #{h.link_to [article.team_member.forename, article.team_member.surname].join(" "), article.team_member}" unless article.team_member.blank?
  end

  def summary
    h.simple_format article.summary if article.summary
  end

  def content
    h.raw article.content if article.content
  end

  def index_image
    image(:index)
  end

  def activity_stream_image(options = {})
    image(:activity_stream, options)
  end

  def show_image
    image(:show)
  end

  def date(format = :default)
    h.l article.date, format: format
  end

  private

  def image(version, options = {})
    h.image_tag article.image.url(version), options.merge({ title: title, alt: title }) if article.image?
  end

end
