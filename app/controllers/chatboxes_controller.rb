class ChatboxesController < ApplicationController
  def index
    @chatboxes = Chatbox.where(sender_id: current_user.id).or(Chatbox.where(recipient_id: current_user.id))
    # array with name of your convo partner
    @partners_name = @chatboxes.map { |chatbox| chatbox.sender == current_user ? chatbox.recipient.profile.username : chatbox.sender.profile.username }
    @last_msgs_content = @chatboxes.map { |chatbo| chatbo&.messages&.last&.content }
    @last_msgs_username = @chatboxes.map { |chatbox| chatbox&.messages&.last&.user&.profile&.username }
  end

  def show
    @chatbox = Chatbox.find(params[:id])
    @messages = @chatbox.messages
    @message = Message.new
  end

  def new
    @profile = Profile.find params[:profile_id]
    @message = Message.new
  end

  def create
    if params[:message][:content].blank?
      flash[:notice] = "message cannot be blank"
      render :new
    else
      @chatbox = Chatbox.new
      @chatbox.sender = current_user
      @chatbox.recipient = Profile.user(params[:profile_id])
      @chatbox.save

      @message = Message.new(message_params)
      @message[:date] = Time.now
      @message.user = current_user
      @message.chatbox = @chatbox
      @message.save

      redirect_to chatbox_path(@chatbox)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
