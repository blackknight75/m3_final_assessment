Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :items
    end
  end

  get '/search', to: 'search#index', as: 'search'
end
