class ReviewsController < ApplicationController
  before_action :set_review, only: [:index, :new, :show, :create, :destroy]

  def index
    @reviews = Review.select{ |e| e.restaurant_id == @restaurant.id}
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurants_path
  end

  private

  def set_review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require('review').permit(:content, :rating, :restaurant_id)
  end
end
