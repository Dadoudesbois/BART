class ChatboxesController < ApplicationController
  def index
    @chatboxes = Chatbox.all
    @last_msgs = @chatboxes.map { |chatbox| chatbox.messages.last }
  end

  def show
    @chatbox = Chatbox.find(params[:id])
    @messages = @chatbox.messages
    @message = Message.new
  end

  def create
    @chatbox = Chatbox.new
    @chatbox.sender = current_user
    @chatbox.recipient = Profile.user(params[:profile_id])

    if @chatbox.save
      redirect_to chatbox_path(@chatbox)
    # else
    #   render_error
    end
  end
end
