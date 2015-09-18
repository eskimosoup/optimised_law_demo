module Optimadmin
  class AwardsController < Optimadmin::ApplicationController
    before_action :set_award, only: [:show, :edit, :update, :destroy]

    edit_images_for Award, [[:image, { show: ['fit', 150, 80] }]]

    def index
      @awards = Optimadmin::BaseCollectionPresenter.new(collection: Award.positioned.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AwardPresenter)
    end

    def show
    end

    def new
      @award = Award.new
    end

    def edit
    end

    def create
      @award = Award.new(award_params)
      if @award.save
        redirect_to awards_url, notice: 'Award was successfully created.'
      else
        render :new
      end
    end

    def update
      if @award.update(award_params)
        redirect_to awards_url, notice: 'Award was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @award.destroy
      redirect_to awards_url, notice: 'Award was successfully destroyed.'
    end

  private


    def set_award
      @award = Award.find(params[:id])
    end

    def award_params
      params.require(:award).permit(:position, :name, :link, :image, :award_type, :display)
    end
  end
end
