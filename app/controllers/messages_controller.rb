class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @chatbox = Chatbox.find(params[:chatbox_id])
    @message.chatbox = @chatbox
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to chat_room_path(@chat_room) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "chat_rooms/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end


  def is_navbar_white?
    if action_name == 'new'
      return true
    elsif
      action_name == 'edit'
      return true
    else
      return false
    end
  end
  # before_action :set_chatbox, only: [:create]
  # before_action :set_message, only: [:edit, :update, :destroy]

  # def new
  #   @message = Message.new
  # end

  # def create
  #   @message = Message.new(message_params)
  #   @message[:date] = Time.now
  #   @message.user = current_user
  #   @message.chatbox = @chatbox

  #   if @message.save
  #     redirect_to chatbox_path(@chatbox)
  #   # else
  #   #   render_error
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @message.update(message_params)
  #     redirect_to chatbox_path(@message.chatbox)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @chatbox = @message.chatbox
  #   @message.destroy

  #   redirect_to chatbox_path(@chatbox)
  # end

  # private

  # def message_params
  #   params.require(:message).permit(:content)
  # end

  # def set_message
  #   @message = Message.find(params[:id])
  # end

  # def set_chatbox
  #   @chatbox = Chatbox.find(params[:chatbox_id])
  # end
end
