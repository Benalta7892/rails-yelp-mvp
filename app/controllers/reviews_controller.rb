# frozen_string_literal: true

# Restaurants ccontroller
class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[ index new create ]

  # GET /reviews
  def index
    @reviews = Review.where(restaurant_id: @restaurant)
  end

  # GET /reviews/1
  def show
    @review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    redirect_to restaurant_path(@review.restaurant), notice: 'Review was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end
end
