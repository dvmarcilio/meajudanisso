MeAjudaNisso::Application.routes.draw do

 resources :perguntas do
 	collection do
	 	get :bem_votadas
	end
	
	member do
		put :votar
	end
 end
end
