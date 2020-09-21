Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  get '/search' => 'search#search'
  resources :users, only: [:show,:index,:edit,:update]do
  	resources :relationships, only:[:create, :destroy]
  	get "follows" =>  'relationships#follows'
  	get "follower" => 'relationships#follower'
end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end