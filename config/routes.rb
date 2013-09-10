MeAjudaNisso::Application.routes.draw do

 resources :perguntas do
 	collection do
	 	get :bem_votadas
	end
	
	resource :votos, controller: "perguntas/votos", only: [] do
	  put :positivo, :negativo, :on => :member
	end
 end
 
end
