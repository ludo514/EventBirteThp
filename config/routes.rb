Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :users, only: [:show]
  resources :events, except: [:edit,:destroy]
  delete 'events/:id', to: 'events#destroy', as: 'delete_event'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
