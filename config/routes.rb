Rails.application.routes.draw do
  mount Optimadmin::Engine => "/admin"

  resources :service_categories, only: :show, path: 'service-category'
  resources :services, only: :show do
    member do
      get 'team_member_search', path: 'team-member-search'
    end
  end
  resources :departments, only: :show

  resources :articles, only: :show
  resources :article_categories, only: :show, path: 'article-category'

  resources :events, only: :show
  resources :event_categories, only: :show, path: 'event-category'
  resources :event_locations, only: :show, path: 'event-location'


  resources :videos, only: :show
  resources :video_categories, only: :show, path: 'video-category'

  resources :team_members, only: [:index, :show], path: 'team-members'
  resources :offices, only: :show
  resources :office_locations, only: :show, path: 'office-locations'

  get 'service-page', to: 'application#service_page'
  get 'service-page-detailed', to: 'application#service_page_detailed'

  root to: "application#index"
end

Optimadmin::Engine.routes.draw do
  get 'team_members/service_search'

  resources :video_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :videos, except: [:show] do
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
  resources :event_locations, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :event_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :events, except: [:show] do
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
  resources :office_locations, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :business_partners, except: [:show] do
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
  resources :awards, except: [:show] do
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
  resources :article_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :offices, except: [:show] do
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
  resources :team_member_roles, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :team_members, except: [:show] do
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
  resources :testimonials, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :articles, except: [:show] do
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
