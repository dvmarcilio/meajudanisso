class UsersController < ApplicationController
	def new
		@usuario = User.new
	end

	def create
		 @user = User.create!(params[:user])
		 if @user.save
		 	redirect_to @user
		 else
		 	render 'new'
			#redirect_to root_path, notice: "Cadastro Realizado Com Sucesso!"
		end
	end

	def show
	 	@user = User.find(params[:id])
	end
end
