class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :objects

  def index
    @presented_departments = BaseCollectionPresenter.new(collection: Department.positioned.displayable, view_template: view_context, presenter: DepartmentPresenter)
    @presented_articles = BaseCollectionPresenter.new(collection: Article.displayable, view_template: view_context, presenter: ArticlePresenter)
    @presented_business_partners = BaseCollectionPresenter.new(collection: BusinessPartner.positioned.displayable, view_template: view_context, presenter: BusinessPartnerPresenter)
    @presented_testimonials = BaseCollectionPresenter.new(collection: Testimonial.positioned.displayable, view_template: view_context, presenter: TestimonialPresenter)
  end

  def service_page
  end

  def service_page_detailed
  end

  private

  def objects
    @presented_awards = BaseCollectionPresenter.new(collection: Award.positioned.displayable, view_template: view_context, presenter: AwardPresenter)
    @header_menu = Optimadmin::Menu.new(name: "header")
    @header_aside_menu = Optimadmin::Menu.new(name: "header_aside")
    @footer_menu = Optimadmin::Menu.new(name: "footer")
  end

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings
end
