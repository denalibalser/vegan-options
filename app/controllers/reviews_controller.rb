class ReviewsController < ApplicationController
  before_action :authorized
  before_action :find_review, only: [:edit, :update, :destroy] 

  def create
    @review = Review.new(review_params)
    if @review.valid? 
      @review.save
      redirect_to restaurant_path(@review.restaurant)
    else 
      render '_form'
    end 
  end

  def edit
    if @review == nil 
      flash[:alert] = "Invalid review attempt."
      redirect_to states_path
    end
  end 
      
  def update 
    if @review.valid? 
      @review.update(review_params)
      redirect_to restaurant_path(@review.restaurant)
    else 
      render 'edit'
    end
  end 

  def destroy 
    @review.destroy
    redirect_to restaurant_path(@review.restaurant) 
  end 

  private

  def find_review
    @review = Review.find_by(id: params[:id])
  end 
      
  def review_params
    params.require(:review).permit(:body, :user_id, :restaurant_id)
  end
end
