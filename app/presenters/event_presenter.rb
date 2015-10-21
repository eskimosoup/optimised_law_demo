class EventPresenter < BasePresenter

  presents :event

  delegate :title, to: :event

  def linked_title
    begin
      h.link_to title, event, title: event.title, class: 'service-event-title'
    rescue
      h.content_tag :span, title, class: 'service-event-title invalid-link'
    end
  end

  def link
    begin
      h.link_to title, event
      result = event
    rescue
      result = '#'
    end

    result
  end

  def summary
    h.raw event.summary
  end

  def start_date(format = :day_month)
    h.l event.start_date_time.to_date, format: format
  end

  def start_day
    h.l event.start_date_time.to_date, format: :day
  end

  def start_month
    h.l event.start_date_time.to_date, format: :month
  end
end
