class CaseStudyPresenter < BasePresenter
  presents :case_study
  delegate :title, to: :case_study

  def link
    case_study
  end

  def case_study_category
    case_study.case_study_category
  end

  def case_study_category_name
    case_study_category.name
  end

  def summary
    h.simple_format case_study.summary
  end

  def content
    h.raw case_study.content
  end

  def date(format = :default)
    h.l case_study.date, format: format
  end

  def read_more_link
    begin
      h.link_to 'Read more', case_study, class: 'service-content-tab-read-more'
    rescue
      h.content_tag :span, 'Read more', class: 'service-content-tab-read-more invalid-link'
    end
  end

  def linked_index_image
    begin
      h.link_to index_image(alt: title), case_study, class: 'service-content-tab-content-item' if case_study.image?
    rescue
      h.content_tag :span, index_image(alt: title), class: 'service-content-tab-content-item invalid-link' if case_study.image?
    end
  end
end
