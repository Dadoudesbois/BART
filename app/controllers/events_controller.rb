class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :bar_authorization, only: [:new, :create]
  before_action :owner_authorization, only: [:edit, :update, :delete]

  def index
    @events = Event.all
  end

  def show
    @artist = @event.user.profile
  end

  def new
    @event = Event.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @event = Event.new(event_params)
    @profile = Profile.find(params[:profile_id])
    @event.user = @profile.user
    # Should be a select if a user has multiple bars
    @event.bar = current_user.bars.first

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to root_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start_date, :end_date, :description, :photo, :name)
  end

  def bar_authorization
    redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action') if current_user.profile.is_bar_manager == false
  end

  def owner_authorization
    redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action') if @event.bar.user != current_user
  end
end
