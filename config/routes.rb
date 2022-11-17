Rails.application.routes.draw do
  get 'admin/users'
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#index"
end
