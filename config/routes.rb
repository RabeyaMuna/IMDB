Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :posts do
      resources :post_ratings
      resources :comments
      resources :post_reports
  end
end
