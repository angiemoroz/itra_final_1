Rails.application.routes.draw do

   resources :tags, except: :show
  get 'tags/:tag', to: 'user_instructions#index'	
  resources :instruction_steps
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  resources :user_instructions do
  	get :get_appropriate_tags
  	get :get_all_tags
  end
  resources :users
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_instructions#index'

  

end

