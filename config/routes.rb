MeAjudaNisso::Application.routes.draw do

 resources :perguntas do
 	collection do
	 	get :bem_votadas
	end
	
	member do
		put :votar_positivo
		put :votar_negativo
	end
	
	resource :voto, controller: "perguntas/voto", only: [] do
	  put :positivo, :negativo, :on => :member
	end
 end
 
end
