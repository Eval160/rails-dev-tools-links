Rails.application.routes.draw do
  devise_for :users
  namespace :user do
    root :to => 'resources#index'
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :resources do
    resources :favorites, only: :create
  end
  resources :favorites, only: [:destroy, :index]
  resources :categories, only: [:new, :create]

  get "/my_resources", to: "resources#user_resources", as: "user_resources"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :resources, only: [ :show, :create ]
    end
  end

  get "/download", to: "pages#download", as: "download"
  get "/about", to: "pages#about", as: "about"

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
