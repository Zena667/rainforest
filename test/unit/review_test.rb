require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  setup do
    #Arrange necessary preconditions and inputs
    @p = FactoryGirl.create(:product)
    @u = FactoryGirl.create(:user)
  end

  test "requires a user" do
  end
  
  test "requires a comment" do
  end  



end