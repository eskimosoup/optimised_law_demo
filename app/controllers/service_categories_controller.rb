class ServiceCategoriesController < ApplicationController
  def show
    @presented_service_category = ServiceCategoryPresenter.new(object: ServiceCategory.displayable.find(params[:id]), view_template: view_context)
  end
end
