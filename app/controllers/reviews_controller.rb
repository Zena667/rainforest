class ReviewsController < ApplicationController
  # The load product method retreives the appropriate product so a new review can be associated to it.
  before_filter :load_product

  def show
    @review = Review.find(params[:id])
  end

  def create
    # @review = @product.reviews.build(
    #   comment: params[:review][:comment],
    #   user_id: current_user.id
    #   )
      # Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
      # You could use a longer alternate syntax if it makes more sense to you
      # 
      @review = Review.new(
        :comment    => params[:review][:comment], 
        :product_id => @product.id, 
        :user_id    => current_user.id
      )

    if @review.save
        redirect_to products_path, notice: 'Review created successfully'
      else
        render :action => :show
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def load_product
    @product = Product.find(params[:product_id])
  end

end
