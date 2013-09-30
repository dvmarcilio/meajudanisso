require 'spec_helper'

describe UsersController do
	 describe "POST /create" do
      it "salvar novo usuario no banco de dados" do
      	lambda do
          post :create
        end.should change(User, :count).by(1)
      end
  end
end
