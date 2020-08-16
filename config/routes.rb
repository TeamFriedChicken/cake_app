Rails.application.routes.draw do
  
  namespace :admin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
    get 'members/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'order_detals/index'
    get 'order_detals/show'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  get 'order_detals/index'
  get 'order_detals/show'
  get 'items/index'
  get 'items/new'
  get 'items/show'
  get 'items/edit'
  namespace :admin do
    get 'members/new'
  end
  namespace :admin do
    get 'home/top'
  end
  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  # --------------------------------members----------------------------------------------
  
  scope module: :member do

    #root to: 'home#top'
    get 'about', to: 'home#about'
    
    resources :members, only: [:show, :edit, :update] do

      resources :orders, only: [:create, :show, :index]
      get 'orders/:id', to: 'orders#new'
      get 'orders/:id/comfirm', to: 'orders#comfirm'

      resources :cart_items, only: [:index, :update, :destroy, :create]
      delete 'members/cart_items', to: 'cart_items#all_destroy'

      resources :delivery_address, only: [:index, :create, :edit, :update, :destroy]

    end

    get 'orders/:id/complete', to: 'orders#complete'

    get 'members/:id/resignation', to: 'members#resignation'
    patch 'members/:id', to: 'members#quit'
    
    resources :items, only: [:index, :show]

  end
  # --------------------------------members----------------------------------------------
  
  # --------------------------------admin----------------------------------------------
  
  get 'admin/top', to: 'admin/home#top'

  namespace :admin do
    
    resources :members, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_detals, only: [:index, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:update]
    
  end
  # ------------------------------------------------------------------------------------

end
