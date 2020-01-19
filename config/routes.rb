Rails.application.routes.draw do
  resources :lists, only: [:create, :show, :destroy, :update, :index] do
    resources :items, only: [:create, :show, :destroy, :update, :index]
  end
  resources :items, only: [:create, :show, :destroy, :update, :index]
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'sessions#logged_out'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end
