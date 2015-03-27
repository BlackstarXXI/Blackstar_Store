Rails.application.routes.draw do
  
  get 'products' => 'products#index'

  get 'products/:id' => 'products#show', as: 'product',  id: /\d+/ 

  root to: 'products#index'

end
