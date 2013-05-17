Meetspace::Application.routes.draw do
  get "list/index", :id => "list"
  match "list" => "list#index"

  resources :enquirers

  resources :venues

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end