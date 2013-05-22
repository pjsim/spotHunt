Meetspace::Application.routes.draw do

  resources :venue_locations

  resources :venues

  resources :directions

  get "list/index", :id => "list"
  match "list" => "list#index"

  resources :enquirers

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end