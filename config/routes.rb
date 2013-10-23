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
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'pages#home'
  match '/cadastrar',  to: 'users#new'
  match '/login',  to: 'sessions#new',         via: 'get'
  match '/logout', to: 'sessions#destroy',     via: 'delete'
 
end
