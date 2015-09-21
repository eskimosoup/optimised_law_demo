module NavigationHelper
  # http://stackoverflow.com/questions/4289272/how-do-i-create-a-dynamically-generated-breadcrumb-in-rails-3
  
  def ensure_navigation
    @navigation ||= [ { title: 'Home', url: '/' } ]
  end

  def navigation_add(title, url)
    ensure_navigation << { title: title, url: url }
  end

  def render_navigation
    render partial: 'shared/breadcrumbs', locals: { navigation: ensure_navigation }
  end
end
