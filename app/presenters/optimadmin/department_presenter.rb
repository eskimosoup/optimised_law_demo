module Optimadmin
  class DepartmentPresenter < Optimadmin::BasePresenter
    presents :department

    def name
      department.name
    end
  end
end