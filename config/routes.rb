Rails.application.routes.draw do
  
  devise_for :users
  resources :shoes
  root to: "shoes#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
