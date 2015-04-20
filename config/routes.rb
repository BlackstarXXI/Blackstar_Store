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
  get 'new_products', to: 'products#brandnew', as: 'new_products'
  get 'on_sale', to: 'products#onsale', as: 'on_sale'
  get 'search_results', to: 'products#search_results', as: 'search_results'
  get 'price_asc', to: 'products#priceasc', as:'by_price_asc'
  get 'price_desc', to: 'products#pricedesc', as:'by_price_desc'
  get 'name_asc', to: 'products#nameasc', as:'by_name_asc'
  get 'name_desc', to: 'products#namedesc', as:'by_name_desc'

  
  get 'products' => 'products#index'
  get 'products/:id' => 'products#show', as: 'product',  id: /\d+/ 

  root to: 'products#index'

end
