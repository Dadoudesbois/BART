class MessagesController < ApplicationController
  before_action :set_chatbox, only: [:create, :edit, :update, :destroy]
  before_action :set_message, only: [:edit, :update, :destroy]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message[:date] = Time.now
    @message.chatbox = @chatbox
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to chatbox_path(@chatbox)
    else
      render :edit
    end
  end

  def destroy
    @message.destroy

    redirect_to chatbox_path(@chatbox)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def set_chatbox
    @chatbox = Chatbox.find(params[:chatbox_id])
  end
end
