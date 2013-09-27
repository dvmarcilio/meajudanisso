MeAjudaNisso::Application.routes.draw do

  root to: 'pages#home'

 resources :questions do
 	collection do
	 	get :most_voted
	end
	
	resource :votes, controller: "questions/votes", only: [] do
	  put :positivo, :negativo, :on => :member
	end
 end
 resources :users
 
end
