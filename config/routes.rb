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
  resources :posts
  # resources :users
  #   resources :posts do
  #     resources :comments
  #     resources :post_reports
  #     resources :reports
  #   end
end
