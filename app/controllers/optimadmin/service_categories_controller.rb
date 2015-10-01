module Optimadmin
  class ServiceCategoriesController < Optimadmin::ApplicationController
    before_action :set_service_category, only: [:show, :edit, :update, :destroy]

    edit_images_for ServiceCategory, [[:image, { show: ['fill', 438, 499] }]]

    def index
      @service_categories = Optimadmin::BaseCollectionPresenter.new(collection: ServiceCategory.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ServiceCategoryPresenter)
    end

    def show
    end

    def new
      @service_category = ServiceCategory.new
    end

    def edit
    end

    def create
      @service_category = ServiceCategory.new(service_category_params)
      if @service_category.save
        redirect_to service_categories_url, notice: 'Service category was successfully created.'
      else
        render :new
      end
    end

    def update
      if @service_category.update(service_category_params)
        redirect_to service_categories_url, notice: 'Service category was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @service_category.destroy
      redirect_to service_categories_url, notice: 'Service category was successfully destroyed.'
    end

  private


    def set_service_category
      @service_category = ServiceCategory.find(params[:id])
    end

    def service_category_params
      params.require(:service_category).permit(:department_id, :name, :sub_heading, :summary, :image, :suggested_url, :display, :leaflet, :remote_leaflet_url, :leaflet_cache, :remove_leaflet)
    end
  end
end
