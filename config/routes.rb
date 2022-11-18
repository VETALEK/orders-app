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

  delete 'admin/items/:id/delete' => 'items#destroy', as: 'admin_items_delete'
  
  get 'admin/items/:id/delete' => 'items#destroy'
end
