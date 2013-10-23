MeAjudaNisso::Application.routes.draw do

  resources :questions do
   	collection do
  	 	get :most_voted
  	end
	
  	resources :answers
  end
  
  resources :answers
  
  [:questions, :answers].each do |resource_type|
    resources resource_type do
      post :vote_up, :vote_down, :on => :member
    end
  end
  
  resources :users	

  authenticated :user do
	'current_user'
  end
  root :to => 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
end
