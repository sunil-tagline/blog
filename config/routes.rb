Rails.application.routes.draw do
  namespace :admin do
      resources :articles
      resources :comments
      resources :people
      resources :roles

      root to: "articles#index"
    end
  devise_for :people
  root "articles#index"

  resources :articles do
    resources :comments
  end
end
