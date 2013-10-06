class UsersController < ApplicationController
	def new
		@usuario = User.new
	end

	def create
		 @usuario = User.create(params[:user])
		 if @usuario.save
		 	flash[:success] = "Cadastro Realizado com Sucesso!"
		 	redirect_to @usuario
		 else
		 	render 'new'
		end
	end

	def show
	 	@usuario = User.find(params[:id])
	end

	private

    def user_params
      params.require(:user).permit(:nome, :email, :password,
                                   :password_confirmation)
    end
end
