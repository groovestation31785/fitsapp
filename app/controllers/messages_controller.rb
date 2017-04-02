class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  def home
    # if logged in, find sent messages and received messages with the current user's id
    # set that to @messages

      # redirect_to signin_path, notice: 'You have to be logged it to do that!!'
  end

  def show
  end

  def new
    if current_user
      @message = Message.new
    else
      redirect_to signup_path, notice: 'You have to be logged it to do that!!'
    end
  end

  def create
    @receiver = Client.find_by(params[:username])
    @message = Message.new(messsage_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully sent.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:subject, :content, :sender_id, :username)
    end
end
