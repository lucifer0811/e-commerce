Rails.application.routes.draw do
  root "application#api"
  get "api_document" => "application#api"
  devise_for :users

  namespace :api, defaults: {format: "json"} do
    scope module: :v1 do
      resources :users, only: [:show, :create, :update] do
        resources :orders, only: [:index, :show, :create]
      end
      resources :sessions, only: [:create, :destroy]
      resources :categories do
        resources :products
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
