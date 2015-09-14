Rails.application.routes.draw do
  get 'services/show'

  mount Optimadmin::Engine => "/admin"

  resources :service_categories, only: :show, path: 'service-category'
  resources :services, only: :show
  resources :departments, only: :show

  get 'service-page', to: 'application#service_page'
  get 'service-page-detailed', to: 'application#service_page_detailed'

  root to: "application#index"
end

Optimadmin::Engine.routes.draw do
  resources :articles, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end

  resources :service_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :services, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :departments, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
end
