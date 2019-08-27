class ArtistPicturesController < ApplicationController
  before_action :set_picture, only: [:destroy]
  before_action :set_profile, only: [:new, :create]
  before_action :profile_authorization, only: [:new, :create]
  before_action :delete_authorization, only: [:destroy]

  def new
    @artist_picture = ArtistPicture.new
  end

  def create
    images = params.dig(:artist_picture, :artist_pictures) || []
    images.each do |image|
      @profile.artist_pictures.create(photo: image)
    end

    redirect_to profile_path(@profile)
  end

  def destroy
    @profile = @artist_picture.profile
    @artist_picture.destroy

    redirect_to profile_path(@profile)
  end

  private

  def profile_authorization
    redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action') if @profile.user != current_user
  end

  def delete_authorization
    redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action') if @artist_picture.profile.user != current_user
  end

  def set_picture
    @artist_picture = ArtistPicture.find(params[:id])
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def picture_params
    params.require(:artist_picture).permit(:photo)
  end
end
