class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :profile_authorization [:edit, :update, :destroy]
  def index
    @artists = []
    @profiles = Profile.all
    @profiles.each do |profile|
      if profile.is_artist == true
        @artists << profile
      end
    end
  end

  def show
    @address = profile.address
    @username = profile.username
    @photo = profile.photo
    @artist_description = profile.artist_description
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.new(profile_params)
    @profile.user = @user

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
