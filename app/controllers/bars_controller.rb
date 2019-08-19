class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]

  def index
    @bars = Bar.all
  end

  def show
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

  def set_bar
    @bar = Bar.new(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:address, :description, :name)
  end
end
