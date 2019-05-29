Rails.application.routes.draw do
  root 'blogs#index'
  
  devise_for :users
  
  resources :users do
    resources :blogs
  end
end
