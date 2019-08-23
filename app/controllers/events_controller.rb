class EventsController < ApplicationController
  before_action :set_event, only: [:preview, :show, :edit, :update, :confirm, :destroy]
  before_action :bar_authorization, only: [:new, :create]
  before_action :owner_authorization, only: [:edit, :update, :delete]

  skip_before_action :authenticate_user!, only: [:preview]

  def index
    # I don't think index is used anywhere (Pages#home instead), but just to be safe:
    # @events = Event.all
    @events = Event.where('confirmed = true AND end_date >= ?', DateTime.now).order('end_date ASC')

    @bars = Bar.geocoded

    @markers = @bars.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
        image_url: helpers.asset_url('Sea-breeze.png')
      }
    end
  end

  def preview
    @artist = @event.user.profile
  end

  def show
    @artist = @event.user.profile

    @bar = Bar.find(params[:id])

    @markers = [{
        lat: @bar.latitude,
        lng: @bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: @bar }),
        image_url: helpers.asset_url('Sea-breeze.png')
      }]

    @pictures = @bar.pictures
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

  def confirm
    @event.confirmed = true
    @event.save
    redirect_to dashboard_profile_path(@event.user.profile)
  end

  def destroy
    @event.destroy

    redirect_to dashboard_profile_path(current_user.profile)
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
