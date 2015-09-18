module Optimadmin
  class OfficeLocationPresenter < Optimadmin::BasePresenter
    presents :office_location
    delegate :name, to: :office_location

    def id
      office_location.id
    end
  end
end
