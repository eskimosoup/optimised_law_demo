class DepartmentsController < ApplicationController
  before_action :check_slug, only: :show

  def show
    @presented_department = DepartmentPresenter.new(object: @department, view_template: view_context)
    @presented_tour_entries = BaseCollectionPresenter.new(collection: TourEntry.where(page: "#{controller_name.classify}_#{@department.id}").positioned.displayed, view_template: view_context, presenter: TourEntryPresenter)
  end

  private

    def check_slug
      @department = Department.displayed.find(params[:id])
      redirect_to @department, status: :moved_permanently if request.path != department_path(@department)
    end
end
