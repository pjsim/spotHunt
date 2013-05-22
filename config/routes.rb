Meetspace::Application.routes.draw do

  resources :venue_locations, :path => "map"

  resources :venues

  get "list/index", :id => "list"
  match "list" => "list#index", :path => "all-venues"

  resources :enquirers, :path => "inbox"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end