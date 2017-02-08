Rails.application.routes.draw do

  namespace :api do
    resources :board, only: [:index, :create]
  end

  root to: 'home#index'

  mount ActionCable.server => "/cable"
end
