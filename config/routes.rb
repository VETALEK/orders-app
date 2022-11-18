Rails.application.routes.draw do
  resources :items
  get 'admin/users'

  devise_for :users
  
  scope "/admin" do
    resources :users
  end

  get 'home/index'

  root "home#index"
end
