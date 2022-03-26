Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  resources :users
    resources :posts do
      resources :comments
      resources :post_reports 
      resources :reports
    end
end
