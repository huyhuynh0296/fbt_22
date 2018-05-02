Rails.application.routes.draw do
  root "static_pages#home"
  get "/gioithieu", to: "static_pages#gioithieu"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
