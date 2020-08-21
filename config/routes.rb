Rails.application.routes.draw do
  # ------------------------------devise--------------------------------------------------
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
  # --------------------------------devise------------------------------------------------

  # --------------------------------members----------------------------------------------

  scope module: :member do

    root to: 'home#top'
    get 'about', to: 'home#about'

    resource :members, only: [:show, :edit, :update] do

      resources :cart_items, only: [:index, :update, :destroy, :create]
      delete 'cart_items', to: 'cart_items#destroy_all'

      resources :delivery_address, only: [:index, :create, :edit, :update, :destroy]

    end

    get 'orders/confirm', to: 'orders#confirm'
    get 'orders/complete', to: 'orders#complete'
    resources :orders, only: [:new, :create, :show, :index]

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

    resources :order_detals, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]

  end
  # -----------------------------------admin--------------------------------------------

end
