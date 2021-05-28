class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :room_id, only: %i[ create ]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    SendMessageJob.perform_now(@message)
    @room_user = []
    @room.users.each do |user|
      @room_user << user
    end
    
    if Message.where(room_id: @room.id, user_id: current_user.id).count == 1
      UserMailer.with(user: @room_user).welcome_email.deliver_now
    end
  end

  # def update
  #   respond_to do |format|
  #     if @message.update(message_params)
  #       format.html { redirect_to @message, notice: "Message was successfully updated." }
  #       format.json { render :show, status: :ok, location: @message }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @message.destroy
  #   respond_to do |format|
  #     format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :room_id, :user_id)
    end

    def room_id
      @room = Room.find(params[:message][:room_id])
    end
end
