require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    #Arrange necessary preconditions and inputs
    @u = FactoryGirl.create(:user)
  end

  test "can be created with a password and confirmation" do
    user = User.create(name: "Clare", email: "clare@hotmail.com", password: "password", password_confirmation: "password")
    assert user.valid?
  end

  test "must have a password and confirmation on create" do
    user = User.create(name: "Clare", email: "clare@hotmail.com", password: "", password_confirmation: "password")
    refute user.valid?
    user = User.create(name: "Clare", email: "clare@hotmail.com", password: "password", password_confirmation: "")
    refute user.valid?
  end

  test "email must be unique" do
    user = User.create(name: "Clare", email: "zena@hotmail.com", password: "password", password_confirmation: "password")
    refute user.valid?
  end  

  test "can have many reviews" do
  end
  
  test "can list products it has reviewed without duplicates" do
  end

  test "must have name" do
    @u.name = ""
    refute @u.valid?
  end  
  
end