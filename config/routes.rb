Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out:'logout' }, :controllers => {:registrations => 'user_registrations'}
  resources :users
  get 'static_pages/landing_page'

  resources :products
  #get 'static_pages/about'
  get '/products', to: 'products#index'

  get 'static_pages/contact'

  root 'static_pages#landing_page'
  get 'static_pages/index'

  #root 'static_pages#about' #5.1 TEMPORARILY REROUTED TO ABOUT PAGE
  get 'static_pages/about' #5.1 TEMPORARILY REROUTED TO ABOUT PAGE
  get 'logout/index'

  post 'static_pages/thank_you'

  post 'payments/create'

  resources :orders, only: [:index, :show, :create, :destroy]

  resources :products do #a nested resource block
    resources :comments #a nested resource block
  end

  mount ActionCable.server => '/cable'
  
  resources :users #a nested resource block

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
