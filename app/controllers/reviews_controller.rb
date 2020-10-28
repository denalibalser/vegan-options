class ReviewsController < ApplicationController
    before_action :authorized
    
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
        @review = Review.find_by(id: params[:id]) 
        @restaurant = Restaurant.find_by(id: params[:id])
      end 
      
      def update 
        @review = Review.find_by(id: params[:id]) 
        if @review.valid? 
            @review.update(review_params)

            redirect_to restaurant_path(@review.restaurant)
        else 
            render 'edit'
        end
      end 

      def destroy 
        @review = Review.find_by(id: params[:id])
        @review.destroy

        redirect_to restaurant_path(@review.restaurant) 
      end 

      private

      def get_restaurant 
      end  

      def find_review
      end 
      
      def review_params
        params.require(:review).permit(:body, :user_id, :restaurant_id)
      end
end
