class ReviewsController < ApplicationController
    before_action :authorized
    
    def create
        @review = Review.new(review_params)
      
        @review.save
      
        redirect_to restaurant_path(@review.restaurant)
      end

      def edit
        @review = Review.find_by(id: params[:id]) 
        @restaurant = Restaurant.find_by(id: params[:id])
      end 
      
      def update 
        @review = Review.find_by(id: params[:id]) 
        @review.update(review_params)

        redirect_to restaurant_path(@review.restaurant)
      end 

      def destroy 
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.find_by(id: params[:id])
        @review.destroy

        redirect_to restaurant_path(@review.restaurant) 
      end 
      
      def review_params
        params.require(:review).permit(:body, :user_id, :restaurant_id)
      end
end
