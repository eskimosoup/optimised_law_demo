class EventPresenter < BasePresenter

  presents :event

  delegate :title, to: :event

  def linked_title
    h.link_to title, event, title: event.title
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
