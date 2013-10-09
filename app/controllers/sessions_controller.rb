#encoding: utf-8
class SessionsController < ApplicationController

  def new

  end

  def create
  	user = User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
 # 		redirect_to user_path(user), notice: 'Bem Vindo!'
      sign_in user
      redirect_to user
  	else
  	  flash[:error] = 'Email/Senha inválido'
  	  render 'new'
  	end
  end

  def destroy
  end
end
