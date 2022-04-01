Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/about'=>'homes#about',as: "about"
  resources :beans, only: [:new,:index,:show,:edit]do
    resources :comments, only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :cafes, only: [:new,:create,:index,:show,:edit]do

    resources :comments, only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show,:edit]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
