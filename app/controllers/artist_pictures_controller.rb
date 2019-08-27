class ArtistPicturesController < ApplicationController
  before_action :set_picture, only: [:destroy]
  before_action :set_profile, only: [:new, :create]
  before_action :profile_authorization, only: [:new, :create]
  before_action :delete_authorization, only: [:destroy]

  def new
    @artist_picture = ArtistPicture.new
  end

  def create
    # @artist_picture = ArtistPicture.new(artist_picture_params)
    # @artist_picture.profile = @profile

    images = params.dig(:product, :pictures) || []
    images.each do |image|
      @profile.pictures.create(image: image)
    end

    redirect_to profile_path(@profile)
    # if @artist_picture.save
    #   redirect_to profile_path(@profile)
    # else
    #   render :new
    # end
  end

# def create_pictures
#   images = params.dig(:product, :pictures) || []
#   images.each do |image|
#     @profile.pictures.create(image: image)
#   end
# end

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
    @picture = Picture.find(params[:id])
  end

  def set_profile
    @bar = Profile.find(params[:profile_id])
  end

  def picture_params
    params.require(:artist_picture).permit(:photo)
  end
end
