Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :orders
  resources :order_dispatchers, only: :show do
    resources :order_cables, only: :create
  end
end
