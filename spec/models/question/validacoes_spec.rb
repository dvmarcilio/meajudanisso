require 'spec_helper'

describe "Validacoes" do
  
  describe Question do
    context "Titulo" do
      it { should validate_presence_of(:titulo) }
      it { should_not allow_value("").for(:titulo) }
    end
    
    context "Conteudo" do
      it { should validate_presence_of(:conteudo) }
      it { should_not allow_value("").for(:conteudo) }
    end
    
    context "Tags" do
      it { should validate_presence_of(:tags) }
      it { should_not allow_value([]).for(:tags) }
    end
    
    it { pending { should validate_presence_of(:user) } }
  end
end
