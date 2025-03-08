Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root "tops#index"
  resources :users, only: %i[show]
  resources :recipes, only: %i[index new create edit destroy show update] do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :favorites
    end
    get :search, on: :collection
  end
  resources :favorites, only: %i[create destroy]
  resources :menus, only: %i[index new create edit destroy update show]
end
