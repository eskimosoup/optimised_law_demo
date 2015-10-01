module Optimadmin
  class DepartmentPresenter < Optimadmin::BasePresenter
    presents :department

    def id
      department.id
    end

    def name
      department.name
    end

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.simple_format department.summary
    end
  end
end
