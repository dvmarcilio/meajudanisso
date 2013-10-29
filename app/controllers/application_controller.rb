# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  def auth_user
    if !user_signed_in?
      flash[:warning] = 'Você precisa registrar-se ou fazer login para continuar.'
      redirect_to login_path
    end
  end
end
