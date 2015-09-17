module Optimadmin
  class BusinessPartnersController < Optimadmin::ApplicationController
    before_action :set_business_partner, only: [:show, :edit, :update, :destroy]

    edit_images_for BusinessPartner, [[:image, { show: ['fit', 188, 98] }]]

    def index
      @business_partners = Optimadmin::BaseCollectionPresenter.new(collection: BusinessPartner.positioned.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::BusinessPartnerPresenter)
    end

    def show
    end

    def new
      @business_partner = BusinessPartner.new
    end

    def edit
    end

    def create
      @business_partner = BusinessPartner.new(business_partner_params)
      if @business_partner.save
        redirect_to business_partners_url, notice: 'Business partner was successfully created.'
      else
        render :new
      end
    end

    def update
      if @business_partner.update(business_partner_params)
        redirect_to business_partners_url, notice: 'Business partner was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @business_partner.destroy
      redirect_to business_partners_url, notice: 'Business partner was successfully destroyed.'
    end

  private


    def set_business_partner
      @business_partner = BusinessPartner.find(params[:id])
    end

    def business_partner_params
      params.require(:business_partner).permit(:position, :name, :link, :image, :display)
    end
  end
end
