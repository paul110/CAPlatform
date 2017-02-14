Rails.application.routes.draw do

  namespace :api do
    resources :board, only: [:index, :create, :show]
    resources :sketch, only: [:index, :show, :create, :update]
  end

  mount ActionCable.server => "/cable"

  root to: 'home#index'
end
