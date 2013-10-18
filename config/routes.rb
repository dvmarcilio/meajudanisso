MeAjudaNisso::Application.routes.draw do

 resources :questions do
 	collection do
	 	get :most_voted
	end
	
	resources :answers do
	  member do
	    post :vote_up
	  end
	end
	
	resource :votes, controller: "questions/votes", only: [] do
	  put :positivo, :negativo, :on => :member
	end
 end
 
 resources :users
 resources :sessions, only: [:new, :create, :destroy]

 root to: 'pages#home'
 match '/cadastrar',  to: 'users#new'
 match '/login',  to: 'sessions#new',         via: 'get'
 match '/logout', to: 'sessions#destroy',     via: 'delete'
 
end
