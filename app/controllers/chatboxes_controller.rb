class ChatboxesController < ApplicationController
  def index
    @chatboxes = Chatbox.where(sender_id: current_user.id).or(Chatbox.where(recipient_id: current_user.id))
    # array with name of your convo partner
    @partners_name = @chatboxes.map { |chatbox| chatbox.sender == current_user ? chatbox.recipient.profile.username : chatbox.sender.profile.username }
    @last_msgs_content = @chatboxes.map { |chatbox| chatbox.messages.last[:content] }
    @last_msgs_username = @chatboxes.map { |chatbox| chatbox.messages.last.user.profile.username }
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
