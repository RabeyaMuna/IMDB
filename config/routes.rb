Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users
  resources :users
  # post 'create_user' => 'users#create', as: :create_user   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :posts do
    resources :post_ratings, only: [:create]
    resources :comments
    resources :post_reports, only: [:new, :index, :create, :destroy]
  end

  get :search_with_gem, to: 'search#search_with_gem', as: :search_with_gem
end
