Rails.application.routes.draw do

  devise_for :users

  get '/home', to: 'posts#index'


  root 'posts#index'
  resources :posts do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :feed
      get :delete
      post :follow
      post :unfollow
      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
