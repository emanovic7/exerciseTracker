Rails.application.routes.draw do


  devise_for :users

  scope "/admin" do
    resources :users
  end
  
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"

  resources :exercises
  resources :workouts


end
