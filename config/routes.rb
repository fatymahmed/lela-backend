Rails.application.routes.draw do
  get 'lists/new'
  get 'lists/create'
  get 'lists/show'
  get 'lists/edit'
  get 'lists/update'
  get 'lists/destroy'
  get 'lists/index'
  get 'items/create'
  get 'items/show'
  get 'items/update'
  get 'items/destroy'
  get 'items/index'
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'sessions#logged_out'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end
