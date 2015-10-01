class DepartmentsController < ApplicationController
  before_action :check_slug, only: :show

  def show
    @presented_department = DepartmentPresenter.new(object: @department, view_template: view_context)
  end

  private

    def check_slug
      @department = Department.displayed.find(params[:id])
      redirect_to @department, status: :moved_permanently if request.path != department_path(@department)
    end
end
