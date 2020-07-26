Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show, :index, :edit, :update] do
  	resource :relationships, only:[:create, :destroy]
  	get :follows, on: :member
    get :followers, on: :member
    get :favorite, on: :member
  end
  # get 'users/:id/favorite' => 'users#favorite'

  root to: 'homes#top'
  get '/map_request', to: 'maps#map', as: 'map_request'
  resources :maps, only: [:index]
  get 'about' => 'homes#about'
  get 'myprofile' => 'homes#myprofile'

  resources :posts do
    resource  :like, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
