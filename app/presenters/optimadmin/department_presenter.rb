module Optimadmin
  class DepartmentPresenter < Optimadmin::BasePresenter
    presents :department

    def name
      department.name
    end

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.raw department.summary
    end
  end
end
