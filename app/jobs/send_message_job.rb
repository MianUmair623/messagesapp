class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
  	mine = ApplicationController.render(partial: 'messages/mine',locals: {message: message})
  	their = ApplicationController.render(partial: 'messages/theirs',locals: {message: message})
    
    ActionCable.server.broadcast "room_channel_#{message.room_id}", mine: mine, their: their, message: message
  end
end
