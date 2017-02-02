Rails.application.routes.draw do

  namespace :api do
    resources :board, only: [:index]
  end

  root to: 'home#index'
end
