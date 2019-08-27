class ChatboxesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatbox_#{params[:chatbox_id]}"
  end
end
