class UsersController < ApplicationController
	def new
		@usuario = User.new
	end

	def create
		redirect_to root_path, notice: "Cadastro Realizado Com Sucesso!"
	end
end
