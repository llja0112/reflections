class ReviewsController < ApplicationController
  def show
    @review = Review.find(review_id_param)
  end

  def edit
  end

  def update
  end

  private

  def review_id_param
    params.require(:id)
  end
end
