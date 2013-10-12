class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]
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

	def edit
    	@usuario = User.find(params[:id])
  end

  def update
    	@usuario = User.find(params[:id])
    	if @usuario.update_attributes(params[:user])
    		flash[:sucess] = 'Perfil Atualizado'
    		sign_in @usuario
    		redirect_to @usuario
    	else
    		render 'edit'
    	end
    end

	private

    def user_params
      params.require(:user).permit(:nome, :email, :password,
                                   :password_confirmation)
    end

    def signed_in_user
      redirect_to login_path, notice: "Por favor efetue o login!" unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
