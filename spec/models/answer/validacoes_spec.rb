require 'spec_helper'

describe "Validacoes" do
  
  describe Answer do
    context "Conteudo" do
      it { pending { should validate_presence_of(:conteudo) } }
      it { pending { should_not allow_value("").for(:conteudo) } }
    end
    
    it { pending { should validate_presence_of(:user) } }
  end
end
