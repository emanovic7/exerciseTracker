Rails.application.routes.draw do

  # get 'users/:id' => 'users#show'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"

  resources :users
  resources :exercises
  resources :workouts


end
