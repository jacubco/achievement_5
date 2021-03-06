Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', show: 'simple_pages/thank_you' }
  resources :products do
    resources :comments
  end

  resources :users

  get 'simple_pages/contact'
  get 'simple_pages/about', as: 'about'
  get 'simple_pages/index', as: 'oldHome'
  get 'welcome/index'
  get 'simple_pages/looping'

  resources :orders, only: [:index, :show, :create, :destroy]

  root 'simple_pages#landing_page'
  # Route for contact form on contact page
  post 'simple_pages/thank_you'

  post "/payments/create"

  # Enable page updates with actionCable
  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
