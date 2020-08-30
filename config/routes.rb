Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :item_purchase, only: [:index, :new, :create]
  end
  
end
