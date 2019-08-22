class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:new, :create, :edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.event = @event
    @review.bar = @event.bar
    @review.user = @event.user

    if @review.save
      redirect_to dashboard_profile(current_user.profile)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update
      redirect_to dashboard_profile(current_user.profile)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy

    redirect_to dashboard_profile(current_user.profile)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
