class PicturesController < ApplicationController
  before_action :set_bar, only: [:create, :destroy]
  before_action :bar_authorization [:new, :create, :destroy]

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.bar = @bar

    if @picture.save
      redirect_to bar_path(@bar)
    else
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to bar_path(@bar)
  end

  private

  def bar_authorization
    redirect_back(fallback_location: root_path, flash: 'You are not authorized to perform this action') if @bar.user != current_user
  end

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end

  def picture_params
    params.require(:picture).permit(:url)
  end
end
