Rails.application.routes.draw do
  get 'controllers/orders_controller'

  get 'static_pages/landing_page'

  resources :products
  #get 'static_pages/about'
  get '/products', to: 'products#index'

  get 'static_pages/contact'

  #root 'static_pages#landing_page' <--TEMPORARILY REROUTED
  #get 'static_pages/index' <--TEMPORARILY REROUTED

  root 'static_pages#about' #5.1 TEMPORARILY REROUTED TO ABOUT PAGE
  get 'static_pages/about' #5.1 TEMPORARILY REROUTED TO ABOUT PAGE

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
