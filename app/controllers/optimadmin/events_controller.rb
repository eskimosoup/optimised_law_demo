module Optimadmin
  class EventsController < Optimadmin::ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    edit_images_for Event, [[:image, { index: ['fill', 316, 164], show: ['fill', 165, 135], activity_stream: ['fill', 199, 155] }]]

    def index
      @events = Optimadmin::BaseCollectionPresenter.new(collection: Event.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::EventPresenter)
    end

    def show
    end

    def new
      @event = Event.new
    end

    def edit
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to events_url, notice: 'Event was successfully created.'
      else
        render :new
      end
    end

    def update
      if @event.update(event_params)
        redirect_to events_url, notice: 'Event was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
    end

  private


    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :summary, :image, :content, :start_date_time, :end_date_time, :booking_link, :booking_information, :display, :event_location_id, :event_category_id, service_ids: [], team_member_ids: [])
    end
  end
end
