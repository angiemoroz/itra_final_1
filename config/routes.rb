Rails.application.routes.draw do

	
  resources :instruction_steps
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  resources :user_instructions
  resources :users
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_instructions#index'

  

end

