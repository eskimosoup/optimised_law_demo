module Optimadmin
  class CaseStudyCategoryPresenter < Optimadmin::BasePresenter
    presents :case_study_category
    delegate :name, to: :case_study_category

    def id
      case_study_category.id
    end
  end
end
