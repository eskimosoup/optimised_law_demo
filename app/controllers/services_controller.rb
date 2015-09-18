class ServicesController < ApplicationController
  before_action :check_slug, only: :show

  def show
    @presented_service = ServicePresenter.new(object: @service, view_template: view_context)
    @presented_service_articles = BaseCollectionPresenter.new(collection: @service.articles, view_template: view_context, presenter: ArticlePresenter)
    @presented_service_testimonials = BaseCollectionPresenter.new(collection: @service.testimonials, view_template: view_context, presenter: TestimonialPresenter)
    @presented_service_team_members = BaseCollectionPresenter.new(collection: @service.team_members, view_template: view_context, presenter: TeamMemberPresenter)
    @presented_service_offices = BaseCollectionPresenter.new(collection: @service.offices, view_template: view_context, presenter: OfficePresenter)
    @presented_service_events = BaseCollectionPresenter.new(collection: @service.events, view_template: view_context, presenter: EventPresenter)
    @presented_video = VideoPresenter.new(object: @service.videos.last, view_template: view_context)
  end

  private

    def check_slug
      @service = Service.displayed.find(params[:id])
      return redirect_to @service, status: :moved_permanently if request.path != service_path(@service)
    end

end
