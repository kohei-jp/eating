class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  
  def create
    @review = current_user.reviews.new(review_params)
  
   if @review.save
     redirect_to reviews_path,success:'投稿に成功しました'
   else
     flash[:danger] = "投稿に失敗しました"
     render :new
   end
  end
  
  private
  def review_params
    params.require(:review).permit(:review)
  end
  
end
