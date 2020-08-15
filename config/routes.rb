Rails.application.routes.draw do
  
  # --------------------------------members----------------------------------------------
  #devise_for :members
  
  scope module: :member do

    root to: 'home#top'
    get 'about', to: 'home#about'
    
    resources :members, only: [:show, :edit, :update] do

      resources :orders, only: [:create, :show, :index]
      get 'orders/:id', to: 'orders#new'
      get 'orders/:id/comfirm', to: 'orders#comfirm'
      get 'orders/:id/complete', to: 'orders#complete'

      resources :cart_items, only: [:index, :update, :destroy, :create]
      delete 'members/cart_items', to: 'cart_items#all_destroy'

      resources :delivery_address, only: [:index, :create, :edit, :update, :destroy]

    end

    get 'members/:id/resignation', to: 'members#resignation'
    patch 'members/:id', to: 'members#quit'
    
    resources :items, only: [:index, :show]

  end
  # --------------------------------members----------------------------------------------
  
  # --------------------------------admin----------------------------------------------
  #devise_for :admin
  
  namespace :admin do
    
    get 'admins/top', to: 'home#top'

    resources :members, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_detals, only: [:index, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:update]
    
  end
  # ------------------------------------------------------------------------------------

end
