Rails.application.routes.draw do
  # ------------------------------devise--------------------------------------------------
  devise_for :members, skip:[:registrations], controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords'
  }

  devise_scope :member do
    get 'members/sign_in', to: 'members/registrations#new'
    get 'members/sign_up' => 'members/registrations#new', as: :new_member_registration
    post 'members' => 'members/registrations#create', as: :member_registration
    get 'member/edit' => 'members/registrations#edit', as: :edit_member_registration
    #patch'members'=>'member'に変更 (membersコントローラ内のeditアクションと被るため)
    patch 'member' => 'members/registrations#update', as: nil
    put 'members' => 'members/registrations#update', as: :update_member_registration
    delete 'members' => 'members/registrations#destroy', as: :destroy_member_registration
  end

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

      resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]

    end

    get 'orders/confirm', to: 'orders#confirm'
    get 'orders/complete', to: 'orders#complete'

    resources :orders, only: [:new, :create, :show, :index]
    
    get 'members/resignation', to: 'members#resignation'
    patch 'members/quit', to: 'members#quit'

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
