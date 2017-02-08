Rails.application.routes.draw do

  namespace :api do
    resources :board, only: [:index, :create]
    resources :sketch, only: [:index, :show, :create, :update]
  end

  root to: 'home#index'

  mount ActionCable.server => "/cable"
end
