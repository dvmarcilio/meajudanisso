require 'spec_helper'

describe UsersController do
	 describe "POST /create" do
      it "salvar novo usuario no banco de dados" do
      	lambda do
          post :create, :user => FactoryGirl.attributes_for(:user)
        end.should change(User, :count).by(1)
      end
  end
end
