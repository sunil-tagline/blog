Rails.application.routes.draw do
  devise_for :people
  root "articles#index"

  resources :articles do
    resources :comments
  end
end
