Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resource :home, only: [:index] do
    resources :about, only: [:index]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    get 'following' => 'relationships#show_following'
    get 'followed' => 'relationships#show_followed'
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

end
