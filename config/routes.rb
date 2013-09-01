MeAjudaNisso::Application.routes.draw do
 resources :perguntas, only: [] do
 	get :bem_votadas, :on => :collection
 end
end
