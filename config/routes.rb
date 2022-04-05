Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/about'=>'homes#about',as: "about"
  resources :beans, only: [:new,:create,:index,:show,:edit]do
    resources :comments, only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]
  end
  patch 'beans/:id'=>'beans#update'
  delete 'beans/:id'=>'beans#destroy',as: 'destroy_bean'
  resources :cafes, only: [:new,:create,:index,:show,:edit]do

    resources :comments, only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]
  end
  patch 'cafes/:id'=>'cafes#update'
  delete 'cafes/:id'=>'cafes#destroy',as: 'destroy_cafe'

  resources :users, only: [:show,:edit]
  patch 'users/:id'=>'users#update'
  patch 'users/:id'=>'users#withdrawal',as: 'withdrawal_user'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
