Rails.application.routes.draw do
  root to: "home#index"
  get 'users/index'
  get 'users/show'
  devise_for :users, path: "/", path_names: { sign_in:  "login", 
                                              sign_out: "logout", 
                                              sign_up:  "signup" 
                                            }
end
