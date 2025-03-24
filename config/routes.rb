Rails.application.routes.draw do
  devise_for :users

  # Giriş yapmayan kullanıcılar için giriş sayfasına yönlendirme
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # Kullanıcı rolleri için yönlendirme
  namespace :admin do
    get "dashboard", to: "dashboard#index", as: :dashboard
  end

  namespace :advisor do
    get "dashboard", to: "dashboard#index", as: :dashboard
    get 'projects', to: 'projects#dashboard'
    get 'projects/manage', to: 'projects#manage'
  
    resources :projects do
      collection do
        get :requests  # Teklifleri listeleyen sayfa için route
      end
  
      member do
        post :accept  # Projeyi kabul etme route'u
        post :reject  # Projeyi reddetme route'u
      end
    end

  
    resources :groups, only: [:new, :create, :edit, :update, :destroy]
  end

  

  namespace :student do
    get "dashboard", to: "dashboard#index"

    resources :groups, only: [:index, :new, :create, :show] do
      resources :group_members, only: [:create, :destroy]  # Grup üyeleri ekleme/silme
    end

    resources :projects, only: [:index] do
      resources :project_requests, only: [:new, :create]  # Projeye başvurma
      
    end
  end
end
