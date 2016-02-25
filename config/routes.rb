Rails.application.routes.draw do
root to: "users#index"
resources :users, only: [:new, :create, :show]
resources :tools, only: [:new, :create, :edit, :show, :update, :delete]
namespace :admin do
  get '/admin', to: 'admin#index', as: '/'
  resources :tools, only: [:index]
end

namespace :admin do
  resources :categories
end

get '/login', to: "sessions#new"
post '/login', to: "sessions#create"
delete '/login', to: "sessions#destroy"
end
