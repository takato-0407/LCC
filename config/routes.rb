Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'salaries#index'
  resources :salaries, only:[:index, :new, :create, :destroy]
    resources :results, only: [:index, :destroy]
  end 

