Rails.application.routes.draw do
  root "static_pages#home"
  get "/gioithieu", to: "static_pages#gioithieu"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/signup", to: "users#new"
end
