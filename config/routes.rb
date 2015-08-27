Rails.application.routes.draw do
  mount Optimadmin::Engine => "/admin"

  get 'service-page', to: 'application#service_page'

  root to: "application#index"
end
Optimadmin::Engine.routes.draw do
end
