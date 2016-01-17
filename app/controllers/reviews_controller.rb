class ReviewsController < ApplicationController
  before_action :authenticate_user! # for all actions
  before_action :set_review, only: [:edit, :update, :destroy]

  def edit
    # don't understand this..
    @place = @review.place
  end

  def create
    @review = current_user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to place_path(@review.place), notice: 'Review was successfully created.' }
      else
        # no "new" to render at this point.
        format.hmtl { redirect_to place_path(@review.place), notice: "Something went wrong"}
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to place_path(@review.place), notice: 'Review was successfully updated.' }
      else
        format.hmtl { redirect_to place_path(@review.place), notice: "Something went wrong"}
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to places_path(@review.place), notice: 'Review was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:place_id, :content, :score)
    end
end