class PicturesController < ApplicationController
  before_action :set_bar, only: [:create, :destroy]

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

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end

  def picture_params
    params.require(:picture).permit(:url)
  end
end
