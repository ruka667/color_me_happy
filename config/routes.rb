Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root 'posts#index'
get 'posts/new' => 'posts#new'
get 'posts/spring' => 'posts#spring'
get 'posts/summer' => 'posts#summer'
get 'posts/autumn' => 'posts#autumn'
get 'posts/winter' => 'posts#winter'
get 'posts/personal' => 'posts#personal'
post 'posts/result' => 'posts#result'
get 'posts/result' => 'posts#result'
get 'posts/all' => 'posts#all'
resources :users, only: [:show] 
 resources :posts do
  resources :likes, only: [:create, :destroy]
  end


end
