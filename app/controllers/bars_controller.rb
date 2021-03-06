class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]
  before_action :bar_authorization, only: [:edit, :update, :destroy]

  def index
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

  def show
    @markers = [{
        lat: @bar.latitude,
        lng: @bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: @bar }),
        image_url: helpers.asset_url('Sea-breeze.png')
      }]

    @pictures = @bar.pictures

    @reviews = @bar.bar_reviews

    @star = @bar.bar_average_rating if !@reviews.empty?
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.user = current_user

    if @bar.save
      pictures_bar = Picture.new(bar: @bar)
      pictures_bar.remote_photo_url = "https://res.cloudinary.com/dx8gouewf/image/upload/v1566939669/bar_sign_k4zexn.jpg"
      pictures_bar.save!
      redirect_to bar_path(@bar)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bar.update
      redirect_to bar_path(@bar)
    else
      render :edit
    end
  end

  def destroy
    @bar.destroy

    redirect_to profile_path(current_user)
  end

  private

  def is_navbar_white?
    ["new", "edit"].include?(action_name)
  end

  def bar_authorization
    redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action') if @bar.user != current_user
  end

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:address, :description, :name)
  end
end
