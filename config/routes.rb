Rails.application.routes.draw do
  root "static_pages#home"
  get "/gioithieu", to: "static_pages#gioithieu"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
<<<<<<< HEAD
  get "/signup", to: "users#new"
=======
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users
>>>>>>> a5f22ce... signup-login-logout
end
