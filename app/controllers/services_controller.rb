class ServicesController < ApplicationController
  before_action :check_slug, only: :show

  def show
    @presented_service = ServicePresenter.new(object: @service, view_template: view_context)
    @presented_service_articles = BaseCollectionPresenter.new(collection: @service.articles, view_template: view_context, presenter: ArticlePresenter)
    # FIXME: this is broken :(
    #raise @service.testimonials.to_yaml
    #@presented_testimonials = BaseCollectionPresenter.new(collection: @service.testimonials, view_template: view_context, presenter: TestimonialPresenter)
    #@presented_team_members = BaseCollectionPresenter.new(collection: @service.team_members, view_template: view_context, presenter: TeamMemberPresenter)
    #@presented_offices = BaseCollectionPresenter.new(collection: @service.offices, view_template: view_context, presenter: OfficePresenter)
  end

  private

    def check_slug
      @service = Service.displayable.find(params[:id])
      return redirect_to @service, status: :moved_permanently if request.path != service_path(@service)
    end

end
