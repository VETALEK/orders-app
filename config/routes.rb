Rails.application.routes.draw do
  get 'admin/users'

  devise_for :users
  
  scope "/admin" do
    resources :users
  end

  get 'home/index'

  root "home#index"
end
