Rails.application.routes.draw do
  resources :user_instructions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_instructions#index'
end
