Rails.application.routes.draw do
  namespace :admin do
    resources :boards
    resources :sketches

    root to: "boards#index"
  end

  namespace :api do
    resources :board do
      collection do
        get :register
      end
    end #only: [:index, :create, :show, :update]
    resources :sketch, only: [:index, :show, :create, :update, :destroy]
    resources :links, only: [:index]
    resources :marketplace, only: [:index]
    resources :sessions, only: [:create]
  end

  mount ActionCable.server => "/cable"

  root to: 'admin/boards#index'
end
