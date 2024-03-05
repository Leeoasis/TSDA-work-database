Rails.application.routes.draw do
  devise_for :users
  resources :people, only: [:index, :create]
  root to: 'people#index'
end
