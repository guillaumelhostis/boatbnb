class ReviewsController < ApplicationController
  # def index
  #   @reviews = policy_scope(Review)
  #   @reviews = Review.all
  # end

  # def show
  #   authorize @review
  #   @review = Review.find(params[:id])
  # end

  # def new
  #   authorize @review
  #   @review = Review.new
  # end

  def create
    # @profile = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.target_user_id = params[:user_id]
    @review.creator_user_id = current_user.id
    authorize @review
    if
    @review.save
      redirect_to pages_user_profil_path(@profile)
    else
      redirect_to pages_user_profil_path(@profile), status: :unprocessable_entity
    end
  end

  # def destroy
    #   authorize @review
    #   @review = Review.find(params[:id])
    #   @review.destroy
    #   redirect_to review_path(@review.user), status: :see_other
    # end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
