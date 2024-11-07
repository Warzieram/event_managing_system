Rails.application.routes.draw do
  get "static_pages/index"
  get "static_pages/secret"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html



  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  resources :events
  resources :users
  resources :order, only: [ :new, :create ]

  Rails.application.routes.draw do
    resources :events, only: [ :show ] do
      resources :image, only: [ :create ]
    end
  end

  Rails.application.routes.draw do
    resources :users, only: [ :show ] do
      resources :avatars, only: [ :create ]
    end
  end

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  root to: "events#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
