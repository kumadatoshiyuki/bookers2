Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root to: 'homes#top'
  get "home/about" => "homes#about"
  resources :homes
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
get 'follow/:id' => 'relationships#get_follow', as: 'get_follow'
get 'follower/:id' => 'relationships#get_follower', as: 'get_follower'
get 'search' => 'searches#search'
end