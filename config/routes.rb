Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :events, except: [:edit,:destroy]
  resources :charges, only: [:create]
  get 'charges/new/:id', to: 'charges#new', as: 'new_charge'
  delete 'events/:id', to: 'events#destroy', as: 'delete_event'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
