module Optimadmin
  class EventCategoryPresenter < Optimadmin::BasePresenter
    presents :event_category

    delegate :name, to: :event_category

    def id
      event_category.id
    end
  end
end
