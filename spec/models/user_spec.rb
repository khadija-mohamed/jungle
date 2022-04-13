require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

  # pending "add some examples to (or delete) #{__FILE__}"
  it 'Fail empty name' do
    @user = User.new(name: 'test', email: 'fakeemail@gmail.com', password: 'password', password_confirmation: 'password')

    @user.name = nil
    @user.save
    expect(@user.errors.full_messages).to include("Name can't be blank")
  end

  it 'Fail empty email' do
    @user = User.new(name: 'test', email: 'fakeemail@gmail.com', password: 'password', password_confirmation: 'password')

    @user.email = nil
    @user.save
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'Fail empty password' do
    @user = User.new(name: 'test', email: 'fakeemail@gmail.com', password: 'password', password_confirmation: 'password')

    @user.password = nil
    @user.save
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'Password confirmation' do
    @user = User.new(name: 'test', email: 'fakeemail@gmail.com', password: 'password', password_confirmation: 'password')

    @user.save
    expect(@user.password).to eq(@user.password_confirmation)
  end

  it 'Password length check' do
    @user = User.new(name: 'test', email: 'fakeemail@gmail.com', password: 'pass', password_confirmation: 'pass')

    @user.save
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
  end
  end

  # describe '.authenticate_with_credentials' do
  #   # examples for this class method here
  #   it 'test' do 
  #   end
  # end

end