require 'spec_helper'

describe User do

  before do
    @user = User.new(nome: "Usuario Exemplo", email: "usuario@exemplo.com", password: "123456", password_confirmation: "123456")
  end

  subject { @user }

  it { should respond_to(:nome) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "Quando o nome estiver em branco" do
    before { @user.nome = " " }
    it { should_not be_valid }
  end

  describe "Quando o nome estiver em branco" do
    before { @user.email = " " }
    it { should_not be_valid }
   end

  describe "Quando o nome for grande" do
    before { @user.nome = "a" * 51 }
    it { should_not be_valid }
   end

   describe "Quando o formato do email for invalido" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "Quando o formato do email for valido" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "Quando o email ja foi cadastrado" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "Quando a senha estiver em branco" do
    before do
      @user = User.new(nome: "Usuario Exemplo", email: "usuario@exemplo.com",
                     password: " ", password_confirmation: " ")
    end
  it { should_not be_valid }
  end

  describe "Quando a senha nao conrresponde com a senha confirmada" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "Autenticacao invalida" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "senha valida" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "senha invalida" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

  describe "Quando a senha muito curta" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
end