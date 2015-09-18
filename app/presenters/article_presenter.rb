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
    # this breaks the home page link boxes
    #h.raw "in #{h.link_to article_category.name, article_category}" if article_category.present?
    "in #{article_category.name}" if article_category.present?
  end

  def linked_team_member
    # this breaks the home page link boxes
    #h.raw "by #{h.link_to [article.team_member.forename, article.team_member.surname].join(" "), article.team_member}" if article.team_member.present?
    "by #{[article.team_member.forename, article.team_member.surname].join(" ")}" if article.team_member.present?
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
