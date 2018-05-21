Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "/gioithieu", to: "static_pages#gioithieu"
  get "/bookingtours/show", to: "bookingtours#show"
  get "/admin/categories/show_tour", to: "admin/categories#show_tour"
  delete "/bookingtours/del_finished", to: "bookingtours#destroy_finished"
  get "/bookingtours/update", to: "bookingtours#update"
  resources :users
  namespace :admin do
    resources :categories, only: %i(index destroy update)
    resources :users, only: %i(index destroy)
  end
  resources :tours, only: %i(index show)
  resources :bookingtours, only: %i(index show create destroy update) #cart
  resources :order_details
  resource :cart
end
