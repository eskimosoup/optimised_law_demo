module Optimadmin
  class ServicesController < Optimadmin::ApplicationController
    before_action :set_service, only: [:show, :edit, :update, :destroy]

    edit_images_for Service, [[:image, { index: ['fill', 283, 145], show: ['fill', 165, 135] }]]

    def index
      @services = Optimadmin::BaseCollectionPresenter.new(collection: Service.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ServicePresenter)
    end

    def show
    end

    def new
      @service = Service.new
    end

    def edit
    end

    def create
      @service = Service.new(service_params)
      if @service.save
        redirect_to services_url, notice: 'Service was successfully created.'
      else
        render :new
      end
    end

    def update
      if @service.update(service_params)
        redirect_to services_url, notice: 'Service was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @service.destroy
      redirect_to services_url, notice: 'Service was successfully destroyed.'
    end

  private


    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:department_id, :has_people_helped_widget,
      :parent_id, :name, :image, :summary, :content, :suggested_url, :display,
      :leaflet, :remote_leaflet_url, :leaflet_cache, :layout,
      :remove_leaflet, related_service_ids: [])
    end
  end
end
