Rails.application.routes.draw do
  resources :products, as: 'products'
  get 'simple_pages/contact'
  get 'simple_pages/about', as: 'about'
  get 'simple_pages/index'
  get 'welcome/index'

  resources :orders, only: [:index, :show, :create, :destroy]

  root 'simple_pages#landing_page', as: 'home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
