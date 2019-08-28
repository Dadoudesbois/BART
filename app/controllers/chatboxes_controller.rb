class ChatboxesController < ApplicationController

  def index
    @chatboxes = Chatbox.where(sender_id: current_user.id).or(Chatbox.where(recipient_id: current_user.id)).eager_load(recipient: [:profile], sender: [:profile], messages: :user)

    @chatboxes = @chatboxes.map do |chatbox|
      hash = { id: chatbox.id }
      hash[:partners_name] =  chatbox.sender == current_user ? chatbox.recipient.profile.username : chatbox.sender.profile.username
      hash[:last_msgs_content] = chatbox&.messages&.last&.content
      hash[:last_msgs_username] = chatbox&.messages&.last&.user&.profile&.username
      hash[:user_photo] = chatbox&.messages&.last&.user&.profile&.photo
      hash
    end
  end

  def show
    @chatbox = Chatbox.includes(messages: :user).find(params[:id])
    @sender = @chatbox.sender.profile.username
    @recipient = @chatbox.recipient.profile.username
    @messages = @chatbox.messages
    @usernames = @messages.map { |message| message.user.profile.username }
    @message = Message.new

    @chatboxes = Chatbox.where(sender_id: current_user.id).or(Chatbox.where(recipient_id: current_user.id)).eager_load(recipient: [:profile], sender: [:profile], messages: :user)

    @chatboxes = @chatboxes.map do |chatbox|
      hash = { id: chatbox.id }
      hash[:partners_name] =  chatbox.sender == current_user ? chatbox.recipient.profile.username : chatbox.sender.profile.username
      hash[:last_msgs_content] = chatbox&.messages&.last&.content
      hash[:last_msgs_username] = chatbox&.messages&.last&.user&.profile&.username
      hash[:user_photo] = chatbox&.messages&.last&.user&.profile&.photo
      hash
    end
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
      @profile = Profile.find params[:profile_id]
      @message = Message.new
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

  def is_navbar_white?
    if action_name == 'new'
      return true
    elsif
      action_name == 'edit'
      return true
    elsif
      action_name == 'create'
      return true
    elsif
      action_name == 'index'
      return true
    elsif
      action_name == 'show'
      return true
    else
      return false
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
