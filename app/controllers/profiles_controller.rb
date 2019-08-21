class ProfilesController < ApplicationController
  before_action :set_profile, only: [:dashboard, :show, :edit, :update, :destroy]
  before_action :profile_authorization, only: [:edit, :update, :destroy]
  def index
    @artists = Profile.artist.geocoded

    @markers = @artists.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { profile: profile })
      }
    end
  end

  def dashboard
    if current_user.profile.is_artist
      @current_events = current_user.events.where('start_date >= ?', DateTime.now.beginning_of_day).order('start_date DESC')
      @past_events = current_user.events.where('end_date < ?', DateTime.now.beginning_of_day).order('end_date DESC')
    elsif current_user.profile.is_bar_manager
      @events = Event.where(bar: current_user.bars)
      @current_events = @events.where('start_date >= ?', DateTime.now.beginning_of_day).order('start_date DESC')
      @past_events = @events.where('end_date < ?', DateTime.now.beginning_of_day).order('end_date DESC')
    else
      # Regular users don't have a (favourites) dashboard yet
    end
  end

  def show
       @markers = [{
        lat: @profile.latitude,
        lng: @profile.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { profile: @profile })
      }]
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
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
end
