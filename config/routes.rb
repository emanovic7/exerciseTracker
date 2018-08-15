Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"
  get "/signin", to: "sessions#new"
  get "/workouts", to: "workouts#index"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :users do
      resources :workouts, only: [:show, :index, :new]
  end

  resources :workouts do
    resources :exercises, only: [:show, :index, :new]
  end

  resources :exercises



end
