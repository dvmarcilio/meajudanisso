MeAjudaNisso::Application.routes.draw do
authenticated :user do
	'current_user'
end
  root :to => 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users

 resources :questions do
	collection do
		get :most_voted
	end
	resources :answers
	resource :votes, controller: "questions/votes", only: [] do
	  put :positivo, :negativo, :on => :member
	end
 end
end