class UsersController < ApplicationController
	def new
		@usuario = User.new
	end

	def create
		 @user = User.create!(params[:user])
		redirect_to root_path, notice: "Cadastro Realizado Com Sucesso!"
	end

	def show
	 	@user = User.find(params[:id])
	end
end
