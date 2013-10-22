MeAjudaNisso::Application.routes.draw do

  resources :questions do
   	collection do
  	 	get :most_voted
  	end
	
  	resources :answers
  	
  	resources :votes, only: [] do
	    post :up, :down, :on => :member
	  end	
  end
  
  resources :answers do
    post :vote_up, :vote_down, :on => :member
    resources :votes, only: [] do
	    post :up, :down, :on => :member
	  end	
  end
 
 resources :users
 resources :sessions, only: [:new, :create, :destroy]

 root to: 'pages#home'
 match '/cadastrar',  to: 'users#new'
 match '/login',  to: 'sessions#new',         via: 'get'
 match '/logout', to: 'sessions#destroy',     via: 'delete'
 
end
