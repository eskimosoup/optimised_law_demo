module Optimadmin
  class EventLocationPresenter < Optimadmin::BasePresenter
    presents :event_location

    delegate :address_line_1, :address_line_2, :town, :region, :postcode, to: :event_location

    def id
      event_location.id
    end

    def title
      event_location.name
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw [address_line_1, address_line_2, town, region, postcode].reject{|x| x.blank? }.join(', <br />')
    end
  end
end
