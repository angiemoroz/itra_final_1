Rails.application.routes.draw do
	
  resources :instruction_steps
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  resources :user_instructions
  resources :users
  resources :instruction_steps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_instructions#index'

  #devise_scope :user do
  #	delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end

end
