Rails.application.routes.draw do
  get 'beans/new'
  get 'beans/index'
  get 'beans/show'
  get 'beans/edit'
  get 'cafes/new'
  get 'cafes/index'
  get 'cafes/show'
  get 'cafes/edit'
  get 'users/show'
  get 'users/edit'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
