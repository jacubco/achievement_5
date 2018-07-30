Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users
  resources :products, as: 'products'
  get 'simple_pages/contact'
  get 'simple_pages/about', as: 'about'
  get 'simple_pages/index', as: 'oldHome'
  get 'welcome/index'

  resources :orders, only: [:index, :show, :create, :destroy]

  root 'simple_pages#landing_page', as: 'home'

  # Route for contact form on contact page
  post 'simple_pages/thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
