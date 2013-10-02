require 'spec_helper'
require 'question'

describe "Associacoes" do
  
  describe Question do
    it { should have_many(:answers) }
  end
  
end
