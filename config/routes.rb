Rails.application.routes.draw do


  get '/shop' => 'storefront#index'

  get  '/about' => 'storefront#about'

  devise_for :users
  namespace :admin do
    resources :products
    resources :brands
    resources :categories
  end



 resource :cart, only: [:edit, :update, :destroy]
 # resources gives you seven routes, resource gives you six.  difference is the index view
 #resources: index, new, create, edit, update, destroy, show
#resource: new, create, edit, update, destroy, show
 resources :line_items, only: [:create, :destroy]
 resources :orders, only: [:new, :create, :show]

  root 'storefront#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end



