class ReviewsController < ApplicationController

  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
    render json: @reviews, status: 200
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

 def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      render json: @review, status: :ok, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    head :no_content
  end

  private

  def review_params
    params.require(:review).permit(:author, :body, :rating, :movie_id)
  end

end
