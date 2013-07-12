require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    #Arrange necessary preconditions and inputs
    @p = FactoryGirl.create(:product)
    @u = FactoryGirl.create(:user)
    @v = FactoryGirl.create(:user)
  end

  # Example test
  test "must have a name" do
    #Act on the object of method under test
    @p.name = ""

    #Assert that the expected results have occurred.
    refute @p.valid?
  end
  

  test "must have a description" do
    @p.description = ""

    assert @p.invalid?
  end

  test "must have a price" do
    @p.price_in_cents = ""

    assert @p.invalid?
  end
  
  test "price must be an Integer" do
    @p.price_in_cents = "1"
    assert @p.valid?
    assert_equal Fixnum, @p.price_in_cents.class
    @p.price_in_cents = "a"
    assert @p.invalid?
    assert_equal "is not a number", @p.errors[:price_in_cents].join('')
    # assert_equal "is not a number", @p.errors(:price_in_cents)
  end  

  test "has a formatted price" do
    assert_respond_to(@p, :formatted_price)
  end  

  test "can have many reviews" do
    @p.reviews.create(user_id: @u.id, comment: "this is a new review")
    assert_equal @p.reviews.count, 1
    @p.reviews.create(user_id: @v.id, comment: "this is a another new review")
    assert_equal @p.reviews.count, 2
    # @p.reviews.create(user_id: @u.id, comment: "this is a third review")
    # assert_equal @p.reviews.count, 2
  end

  test "can list users that have reviewed it without duplicates" do
    @p.reviews.create(user_id: @u.id, comment: "this is a new review")
    @p.reviews.create(user_id: @v.id, comment: "this is a another new review")
    a = @p.reviews.first.user_id
    b = @p.reviews.last.user_id
    assert (a != b)
  end  

end