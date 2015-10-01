module Optimadmin
  class CaseStudyPresenter < Optimadmin::BasePresenter
    presents :case_study

    def id
      case_study.id
    end

    def title
      case_study.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format case_study.summary
    end
  end
end
