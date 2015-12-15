class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :objects

  def index
    @presented_tour_entries = BaseCollectionPresenter.new(collection: TourEntry.where(page: 'Home').positioned.displayed, view_template: view_context, presenter: TourEntryPresenter)
    @presented_audiences = BaseCollectionPresenter.new(collection: Audience.positioned.displayed, view_template: view_context, presenter: AudiencePresenter)
    @presented_articles = BaseCollectionPresenter.new(collection: Article.home_page_highlight.displayed, view_template: view_context, presenter: ArticlePresenter)
    @presented_business_partners = BaseCollectionPresenter.new(collection: BusinessPartner.positioned.displayed, view_template: view_context, presenter: BusinessPartnerPresenter)
    @presented_testimonials = BaseCollectionPresenter.new(collection: Testimonial.positioned.displayed, view_template: view_context, presenter: TestimonialPresenter)
    @downloads = DownloadCategory.homepage_highlight
    @presented_downloads = BaseCollectionPresenter.new(collection: @downloads.downloads, view_template: view_context, presenter: DownloadPresenter) if @downloads.present?
  end

  private

  def objects
    @presented_tour_content = AdditionalContentPresenter.new(object: AdditionalContent.displayed.find_by(area: 'Tour Popup'), view_template: view_context)
    @presented_offices = BaseCollectionPresenter.new(collection: Office.displayed, view_template: view_context, presenter: OfficePresenter)
    @presented_awards = BaseCollectionPresenter.new(collection: Award.in_footer, view_template: view_context, presenter: AwardPresenter)
    @client_area = AdditionalContent.area('Client Area')
    @presented_client_area = AdditionalContentPresenter.new(object: @client_area, view_template: view_context)
    @header_menu = Optimadmin::Menu.new(name: "header")
    @header_aside_menu = Optimadmin::Menu.new(name: "header_aside")
    @footer_menu = Optimadmin::Menu.new(name: "footer")
  end

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings
end
