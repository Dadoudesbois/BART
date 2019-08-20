class ChatboxesController < ApplicationController
  def index
    @chatboxes = Chatbox.all
    @last_msgs = @chatboxes.map { |chatbox| chatbox.messages.last }
  end

  def show
    @chatbox = Chatbox.find(params[:id])
    @messages = @chatbox.messages
  end

  def create
    @chatbox = Chatbox.new
    @chatbox.sender = current_user
    @chatbox.recipient = Profile.user

    if @chatbox.save
      redirect_to chatbox_path(@chatbox)
    else
      render_error
    end
  end
end
