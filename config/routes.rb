Rails.application.routes.draw do
  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#show', as: 'line_item'
  delete 'line_items/:id' => 'line_items#destroy'
  post 'line_lists/:id/add' => 'line_lists#add_quantity', as: 'line_list_add'
  post 'line_lists/:id/reduce' => 'line_lists#reduce_quantity', as: 'line_list_reduce'
  post 'line_lists' => 'line_lists#create'
  get 'line_lists/:id' => 'line_lists#show', as: 'line_list'
  delete 'line_lists/:id' => 'line_lists#destroy'
  resources :orders
  resources :collections, only: [:create, :destroy]
  resources :lists, only: [:create, :show, :destroy, :update, :index]
  resources :items, only: [:create, :show, :destroy, :update, :index]
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: 'sessions#logged_out'
  get :logged_in, to: 'sessions#logged_in'
  get :items_to_add, to: 'lists#items_to_add'
  root to: 'static#home'
end
