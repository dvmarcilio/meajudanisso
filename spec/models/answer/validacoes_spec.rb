require 'spec_helper'

describe "Validacoes" do
  
  describe Answer do
    context "Conteudo" do
      it { should validate_presence_of(:conteudo) }
      it { should_not allow_value("").for(:conteudo) }
    end
    
    it { pending { should validate_presence_of(:user) } }
  end
end
