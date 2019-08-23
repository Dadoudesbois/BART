class ProfilesController < ApplicationController
  before_action :set_profile, only: [:dashboard, :show, :edit, :update, :destroy]
  before_action :profile_authorization, only: [:edit, :update, :destroy]
  def index
    @artists = Profile.artist.geocoded

    @markers = @artists.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude,

        infoWindow: render_to_string(partial: "info_window", locals: { profile: profile }),
        image_url: helpers.asset_url('star.png')

      }
    end
  end

  def dashboard
    if current_user.profile.is_artist && current_user.profile.is_bar_manager
      @events = (get_events_artist_current_user + get_events_bar_owner_current_user).uniq
      @unconfirmed_events = get_unconfirmed_events(@events)
      @current_events = get_current_confirmed_events(@events)
      @past_events = get_past_confirmed_events(@events)
    elsif current_user.profile.is_artist
      @events = get_events_artist_current_user
      @unconfirmed_events = get_unconfirmed_events(@events)
      @current_events = get_current_confirmed_events(@events)
      @past_events = get_past_confirmed_events(@events)
    elsif current_user.profile.is_bar_manager
      @events = get_events_bar_owner_current_user
      @unconfirmed_events = get_unconfirmed_events(@events)
      @current_events = get_current_confirmed_events(@events)
      @past_events = get_past_confirmed_events(@events)
    else
      # Regular users don't have a (favourites) dashboard yet
    end
    @reviews = @past_events.map { |event| Review.where(event_id: event.id).where(user_id: current_user.id)[0] }
  end

  def show
    @markers = [{
        lat: @profile.latitude,
        lng: @profile.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { profile: @profile }),
        image_url: helpers.asset_url('star.png')
      }]
  end

  def new
    @profile = Profile.new
  end

  def create
    # @profile = Profile.new(profile_params)
    # @profile.user = current_user
    # @profile = Profile.find(params[:id])
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy

    redirect_to root_path
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:username, :address, :photo, :is_artist, :is_bar_manager, :artist_description)
  end

  def profile_authorization
    if @profile.user != current_user
      redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action')
    end
  end

  def get_events_bar_owner_current_user
    Event.where(bar: current_user.bars)
  end

  def get_events_artist_current_user
    current_user.events
  end

  def get_unconfirmed_events(events)
    events.reject(&:confirmed)
  end

  def get_current_confirmed_events(events)
    events.select { |e| e.confirmed && e.start_date >= DateTime.now.beginning_of_day }
          .sort_by(&:start_date).reverse!
  end

  def get_past_confirmed_events(events)
    events.select { |e| e.confirmed && e.start_date < DateTime.now.beginning_of_day }
          .sort_by(&:end_date).reverse!
  end
end
