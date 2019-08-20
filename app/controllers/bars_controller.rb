class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]
  before_action :bar_authorization, only: [:edit, :update, :destroy]

  def index
    @bars = Bar.geocoded

    @markers = @bars.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude
      }
    end
  end

  def show
    @pictures = @bar.pictures
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.user = current_user

    if @bar.save
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
