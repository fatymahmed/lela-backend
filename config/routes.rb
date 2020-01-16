Rails.application.routes.draw do
  resources :lists do
    resources :items
  end
  resources :items
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'sessions#logged_out'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end
