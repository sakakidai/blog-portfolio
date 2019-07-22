Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'blogs#index'
  get 'home', to: 'home#index'
  resources :categories, except: %i[update edit destroy]
  resources :blogs do
    resource :favarites, only: %i[create destroy]
    resource :comments, only: %i[create destroy]
  end
  resources :users, only: %i[index show] do
    resource :relationships, only: %i[create destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  devise_for :users, path: '/', path_names: { sign_in: 'login',
                                              sign_out: 'logout',
                                              sign_up: 'signup' },
                     controllers: { registrations: 'registrations' }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
