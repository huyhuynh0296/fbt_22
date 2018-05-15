Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "/gioithieu", to: "static_pages#gioithieu"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users
  namespace :admin do
    resources :categories, only: %i(index destroy update)
  end
  resources :bookingtours, only: %i(index show create update destroy)
end
