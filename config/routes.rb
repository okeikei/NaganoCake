Rails.application.routes.draw do

  # 顧客用
# /customers/sign_in ...
  devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
# 管理者用
# /admin/sign_in ...
devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  
  root to: 'public/homes#top'
  get "/home/about" => "public/homes#about"

  get "/item/index" => "public/items#index"
  get "/item/:id" => "public/items#show", as: 'show'
  
  get "/customer/show" => "public/customers#show"
  get "/customer/edit" => "public/customers#edit"
  patch "/customer" => "public/customers#update"
  get "/customer/unsubscribe" => "public/customers#unsubscribe"
  patch "/customer/withdraw" => "public/customers#withdraw"
  
  get "/addresses" => "public/addresses#index"
  get "/address/:id/edit" => "public/addresses#edit", as: 'adderess_edit'
  post "/addresses" => "public/addresses#create"
  patch "/address/:id" => "public/addresses#update", as: 'adderess_update'
  delete "/address/:id" => "public/addresses#destroy", as: 'adderess_destroy'
  
  get "/cart_items" => "public/cart_items#index"
  post "/cart_items" => "public/cart_items#create"
  patch "/cart_item/:id" => "public/cart_items#update"
  delete "/cart_item/:id" => "public/cart_items#destroy", as: 'destroy'
  delete "/cart_items/destroy_all" => "public/cart_items#destroy_all",as: 'all_destroy'
  
  get "/orders/new" => "public/orders#new"
  post "/orders/comfirm" => "public/orders#comfirm"
  get "/orders/complete" => "public/orders#complete"
  post "/orders" => "public/orders#create"
  get "/orders" => "public/orders#index", as: 'order_index'
  get "/order/:id" => "public/orders#show", as: 'order_show'
  
#namespaceをつけるとURLに名前を付けることができる
  namespace :admin do
  root to: 'homes#top'
  resources :items, only: [:new, :create, :index, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
