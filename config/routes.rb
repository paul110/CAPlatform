Rails.application.routes.draw do

  namespace :admin do
    resources :boards
    resources :sketches

    root to: "boards#index"
  end

  namespace :api do
    resources :board, only: [:index, :create, :show, :update]
    resources :sketch, only: [:index, :show, :create, :update, :destroy]
    resources :links, only: [:index]
    resources :marketplace, only: [:index]
  end

  mount ActionCable.server => "/cable"

  root to: 'home#index'
end
