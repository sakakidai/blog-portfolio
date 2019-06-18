Rails.application.routes.draw do
  
  root to: "home#index"
  resources :blogs
  resources :users, only: %i[index show]
  devise_for :users, path: "/", path_names: { sign_in:  "login", 
                                              sign_out: "logout", 
                                              sign_up:  "signup" 
                                            }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
