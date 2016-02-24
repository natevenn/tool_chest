Rails.application.routes.draw do
root to: "users#index"
resources :users, only: [:new, :create, :show]
resources :tools

get '/login', to: "sessions#new"
post '/login', to: "sessions#create"
delete '/login', to: "sessions#destroy"
end
