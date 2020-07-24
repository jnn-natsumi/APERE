Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show, :index, :edit, :update] do
  	resource :relationships, only:[:create, :destroy]
  	get 'follows' => 'relationships#follower', as: 'follows'
  	get 'followers' => 'relationships#followed', as: 'followers'
  end
  get 'users/favorite' => 'users#favorite'

  root to: 'homes#top'
  get 'about' => 'homes#about'

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
