require 'spec_helper'

describe "Associacoes" do

  describe User do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
  end

end 
