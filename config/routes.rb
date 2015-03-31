Rails.application.routes.draw do
  get "about/show"
  get "abouts_controller/show"
  get "contact/show"
  get "contacts_controller/show"
  get "category/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :category, only: [:index, :show ]
  get 'by_category/:id', to: 'product#bycategory', as: 'by_category'
  get 'new_products', to: 'product#brandnew', as: 'new_products'
  get 'on_sale', to: 'product#onsale', as: 'on_sale'
  get 'search', to: 'product#search', as: 'search'
  get 'price_asc', to: 'product#priceasc', as:'by_price_asc'
  get 'price_desc', to: 'product#pricedesc', as:'by_price_desc'
  get 'name_asc', to: 'product#nameasc', as:'by_name_asc'
  get 'name_desc', to: 'product#namedesc', as:'by_name_desc'

  
  get 'products' => 'products#index'
  get 'products/:id' => 'products#show', as: 'product',  id: /\d+/ 

  root to: 'products#index'

end
