class ReviewsController < ApplicationController
  before_action :authenticate_user!
  include ReviewsHelper

  def index
    @complete_reviews = Review.where(reviewer: current_user, status: 'Complete')
    @incomplete_reviews = Review.where(reviewer: current_user, status: 'Incomplete')
  end

  def show
    @review = Review.find(review_id_params)
    if @review.content.blank?
      @review.content = review_html('default')
    end
  end

  def edit
    @review = Review.find(review_id_params)
  end

  def update
    review = Review.find(review_id_params)
    review.content = review_content_params['content']
    review.status = review_content_params['status']
    review.save

    redirect_to :back
  end

  private

  def review_id_params
    params.require(:id)
  end

  def review_content_params
    params.require(:review).permit(
      :content, :status)
  end
end
