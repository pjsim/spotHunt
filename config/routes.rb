Meetspace::Application.routes.draw do
  resources :venue_locations

  resources :venues


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end