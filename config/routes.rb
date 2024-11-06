Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resource :profile, only: [:show, :edit, :update]
  
  # resources :users, only: [:new, :create, :edit, :update]
  
  resources :experiences, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, only: [:new, :create]
  end

   get "my_bookings", to: "bookings#index", as: "my_bookings"

  resources :bookings, only: [:index, :destroy]
  resources :reviews, only: [:destroy]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest"
end
