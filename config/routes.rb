Rails.application.routes.draw do

  namespace :api do
    resources :board, only: [:index, :create]
    resources :sketch, only: [:index, :show, :create]
  end

  root to: 'home#index'
end
