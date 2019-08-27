class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:new, :create, :edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.event = @event
    @review.user = current_user

    if @review.save
      redirect_to dashboard_profile_path(current_user.profile)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to dashboard_profile_path(current_user.profile)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy

    redirect_to dashboard_profile_path(current_user.profile)
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

  def is_navbar_white?
    if action_name == 'new'
      return true
    elsif
      action_name == 'edit'
      return true
    else
      return false
    end
  end

end
