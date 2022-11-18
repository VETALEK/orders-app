Rails.application.routes.draw do
  resources :items

  get 'admin/items'

  get 'admin/users'

  devise_for :users
  
  scope "/admin" do
    resources :users
  end

  get 'home/index'

  root "home#index"

  delete 'items/:id/delete' => 'items#destroy', as: 'items_delete'
  get '/items/:id/delete' => 'items#destroy'
end
