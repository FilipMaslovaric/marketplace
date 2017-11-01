Rails.application.routes.draw do
  get 'cart/create'

  get 'cart/show', to: 'cart#show', as: :cart

  get 'cart/edit'

  get 'cart/add'

  post 'cart/add'

  post 'cart/create'

  resources :products
  resources :shops
  resources :media_contents, only: [:create]
  resources :orders
  resources :charges
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  root 'main#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
