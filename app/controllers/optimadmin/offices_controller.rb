module Optimadmin
  class OfficesController < Optimadmin::ApplicationController
    before_action :set_office, only: [:show, :edit, :update, :destroy]

    def index
      @offices = Optimadmin::BaseCollectionPresenter.new(collection: Office.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::OfficePresenter)
    end

    def show
    end

    def new
      @office = Office.new
    end

    def edit
    end

    def create
      @office = Office.new(office_params)
      if @office.save
        redirect_to offices_url, notice: 'Office was successfully created.'
      else
        render :new
      end
    end

    def update
      if @office.update(office_params)
        redirect_to offices_url, notice: 'Office was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @office.destroy
      redirect_to offices_url, notice: 'Office was successfully destroyed.'
    end

  private


    def set_office
      @office = Office.find(params[:id])
    end

    def office_params
      params.require(:office).permit(:name, :building_name, :building_number, :street, :town, :county, :postcode, :phone_number, :fax_number, :email, :dx_number, :image, :details, :display, :office_location_id)
    end
  end
end
