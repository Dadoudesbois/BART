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
      #Create methods to get unconfirmed events, current_events and past_events of a user

    elsif current_user.profile.is_artist
      @unconfirmed_events = current_user.events.where('confirmed = ?', false)
      # This does not seem to work:
      # @current_events = current_user.events.where("confirmed = ? AND start_date >= ?", [true, DateTime.now.beginning_of_day])
      #                               .order('start_date DESC')
      @current_events = current_user.events.select { |e| e.confirmed && e.start_date >= DateTime.now.beginning_of_day }
                                    .sort_by(&:start_date).reverse!
      @past_events = current_user.events.select { |e| e.confirmed && e.start_date < DateTime.now.beginning_of_day }
                                 .sort_by(&:end_date).reverse!
    elsif current_user.profile.is_bar_manager
      @events = Event.where(bar: current_user.bars)

      @unconfirmed_events = @events.where.not('confirmed = ?', true)

      @current_events = @events.select { |e| e.confirmed && e.start_date >= DateTime.now.beginning_of_day }
                               .sort_by(&:start_date).reverse!
      @past_events = @events.select { |e| e.confirmed && e.start_date < DateTime.now.beginning_of_day }
                            .sort_by(&:end_date).reverse!
    else
      # Regular users don't have a (favourites) dashboard yet
    end
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
end
