Rails.application.routes.draw do
  resources :collections, only: [:create]
  resources :lists, only: [:create, :show, :destroy, :update, :index]
  resources :items, only: [:create, :show, :destroy, :update, :index]
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :collection, to: 'collections#destroy'
  delete :logout, to: 'sessions#logged_out'
  get :logged_in, to: 'sessions#logged_in'
  post :items_to_add, to: 'lists#items_to_add'
  root to: 'static#home'
end
