class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :menus

  private

  def menus
    @header_menu = Optimadmin::Menu.new(name: "header")
    @header_aside_menu = Optimadmin::Menu.new(name: "header_aside")
    @footer = Optimadmin::Menu.new(name: "footer")
  end

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings
end
