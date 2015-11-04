class ServicesController < ApplicationController
  before_action :find_service

  def show
    return redirect_to @service, status: :moved_permanently if request.path != service_path(@service)
    @presented_tour_entries = BaseCollectionPresenter.new(collection: TourEntry.where(page: "#{controller_name.classify}_#{@service.id}").positioned.displayed, view_template: view_context, presenter: TourEntryPresenter)
    @presented_service = ServicePresenter.new(object: @service, view_template: view_context)
    @presented_service_articles = BaseCollectionPresenter.new(collection: @service.articles.limit(3), view_template: view_context, presenter: ArticlePresenter) if @service.articles.present?
    @presented_service_testimonials = BaseCollectionPresenter.new(collection: @service.testimonials, view_template: view_context, presenter: TestimonialPresenter) if @service.testimonials.present?
    @presented_service_team_members = BaseCollectionPresenter.new(collection: @service.team_members, view_template: view_context, presenter: TeamMemberPresenter) if @service.team_members.present?
    @presented_offices = BaseCollectionPresenter.new(collection: @service.offices, view_template: view_context, presenter: OfficePresenter) if @service.offices.present?
    @presented_service_events = BaseCollectionPresenter.new(collection: @service.events, view_template: view_context, presenter: EventPresenter) if @service.events.present?
    @presented_video = VideoPresenter.new(object: @service.videos.last, view_template: view_context) if @service.videos.present?
    @presented_download = DownloadPresenter.new(object: @service.downloads.last, view_template: view_context) if @service.downloads.present?
    @presented_case_studies = BaseCollectionPresenter.new(collection: @service.case_studies.limit(3), view_template: view_context, presenter: CaseStudyPresenter) if @service.case_studies.present?
    @presented_service_awards = BaseCollectionPresenter.new(collection: @service.awards, view_template: view_context, presenter: AwardPresenter) if @service.awards.present?
  end

  def team_member_search
    @presented_service_team_members = BaseCollectionPresenter.new(collection: @service.team_members.location_search(params[:office_id]).name_search(params[:team_member_name]), view_template: view_context, presenter: TeamMemberPresenter)

    respond_to do |format|
       format.js
     end
  end

  private

    def find_service
      @service = Service.displayed.find(params[:id])
    end

end
