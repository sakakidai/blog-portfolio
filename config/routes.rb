Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "blogs#index"
  get "home", to:"home#index" 
  resources :categories, except: [:update, :edit, :destroy]
  resources :blogs do
    resource :favarites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  resources :users, only: %i[index show]
  devise_for :users, path: "/", path_names: { sign_in:  "login", 
                                              sign_out: "logout", 
                                              sign_up:  "signup" 
                                            }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
