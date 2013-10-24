require 'spec_helper'
require 'answer'

describe "Associacoes" do
  describe Answer do
    it { should belong_to(:question) }
    it { should belong_to(:user) }
  end
end
