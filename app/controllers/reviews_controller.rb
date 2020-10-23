class ReviewsController < ApplicationController
    before_action :authorized
    
    def create
        @review = Review.new(review_params)
        @review.restaurant_id = params[:review][:restaurant_id]
        @review.user_id = params[:review][:user_id]
      
        @review.save
      
        redirect_to restaurant_path(@review.restaurant)
      end
      
      def review_params
        params.require(:review).permit(:body, :user_id, :restaurant_id)
      end
end
