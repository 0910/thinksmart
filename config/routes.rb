Rails.application.routes.draw do
 
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    resources :cities, only: [:show, :index] do
      resources :projects, only: [:show, :index] do
        collection do
          get "transport"
          get "development"
          get "environment"
          get "people"
          get "community"
          get "innovation"
        end
      end
      resources :posts, only: [:show, :index] do
        collection do
          get "transport"
          get "development"
          get "environment"
          get "people"
          get "community"
          get "innovation"
        end
      end
      resources :apps do
      end
      collection do
        get "transport"
        get "development"
        get "environment"
        get "people"
        get "community"
        get "innovation"
      end
    end
    resources :posts, only: [:show, :index] do
      collection do
        get "transport"
        get "development"
        get "environment"
        get "people"
        get "community"
        get "innovation"
      end
    end
    resources :projects do
      collection do
        get "transport"
        get "development"
        get "environment"
        get "people"
        get "community"
        get "innovation"
      end
    end
    resources :apps do
    end

    # Home routes
    get 'home/index'
    get '/transport' => 'home#transport'
    get '/development' => 'home#development'
    get '/environment' => 'home#environment'
    get '/people' => 'home#people'
    get '/community' => 'home#community'
    get '/innovation' => 'home#innovation'
  end


  devise_for :users, skip: [:sessions, :passwords, :confirmations, :registrations]
  as :user do
    # session handling
    get     '/login'  => 'devise/sessions#new',     as: 'new_user_session'
    post    '/login'  => 'devise/sessions#create',  as: 'user_session'
    delete  '/logout' => 'devise/sessions#destroy', as: 'destroy_user_session'

    # joining
    get   '/join' => 'devise/registrations#new',    as: 'new_user_registration'
    post  '/join' => 'devise/registrations#create', as: 'user_registration'

    scope '/account' do
      # password reset
      get   '/reset-password'        => 'devise/passwords#new',    as: 'new_user_password'
      put   '/reset-password'        => 'devise/passwords#update', as: 'user_password'
      post  '/reset-password'        => 'devise/passwords#create'
      get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_user_password'

      # confirmation
      get   '/confirm'        => 'devise/confirmations#show',   as: 'user_confirmation'
      post  '/confirm'        => 'devise/confirmations#create'
      get   '/confirm/resend' => 'devise/confirmations#new',    as: 'new_user_confirmation'

      # settings & cancellation
      get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_user_registration'
      get '/settings' => 'devise/registrations#edit',   as: 'edit_user_registration'
      put '/settings' => 'devise/registrations#update'

      # account deletion
      delete '' => 'devise/registrations#destroy'
    end

    scope '/profile' do
      get 'projects' => 'users/projects#index', as: 'user_projects'
    end
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/:locale' => 'home#index'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
  root to: "home#index"
  get 'projects/update_subcategories', as: 'update_subcategories'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
