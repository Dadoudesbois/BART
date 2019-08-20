class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :profile_authorization, only: [:edit, :update, :destroy]
  def index
    @artists = Profile.artist.geocoded

    @markers = @artists.map do |artist|
      {
        lat: artist.latitude,
        lng: artist.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { artist: artist }),
      }
    end
  end

  def show
    @profile

    @markers = [{
        lat: @profile.latitude,
        lng: @profile.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { profile: @profile }),
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
    @profile = profile.find(params[:id])
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
