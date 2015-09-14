class ServiceCategoriesController < ApplicationController
  before_action :check_slug, only: :show

  def show
    @presented_service_category = ServiceCategoryPresenter.new(object: @service_category, view_template: view_context)
  end

  private

    def check_slug
      @service_category = ServiceCategory.displayable.find(params[:id])
      redirect_to @service_category, status: :moved_permanently if request.path != service_category_path(@service_category)
    end
end
