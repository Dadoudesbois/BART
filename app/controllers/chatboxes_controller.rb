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
    chatbox1 = Chatbox.where(sender_id: current_user.id).where(recipient_id: @profile.user.id)
    chatbox2 = Chatbox.where(sender_id: @profile.user.id).where(recipient_id: current_user.id)
    if chatbox1[0]
      redirect_to chatbox_path(chatbox1[0].id)
    elsif chatbox2[0]
      redirect_to chatbox_path(chatbox2[0].id)
    else
      @message = Message.new
    end
  end

  def create
    if params[:message][:content].blank?
      flash[:notice] = "message cannot be blank"
      redirect_to new_profile_chatbox_path(params[:profile_id])
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
