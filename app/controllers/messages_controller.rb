class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  def index
    if current_client
    # if logged in, find sent messages and received messages with the current user's id
    # set that to @messages
    else
      redirect_to login_path, flash[:warning] = 'You have to be logged it to do that!!'
    end
  end

  def show
  end

  def new
    if current_client
      @message = Message.new
    else
      redirect_to signup_path, flash[:warning] = 'You have to be logged it to do that!!'
    end
  end

  def create
    @receiver = Client.find_by(params[:username])
    @message = Message.new(messsage_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, flash[:success] = 'Message was successfully sent.' }
      else
        format.html { render :new, flash[:warning] = 'You must fill in all fields correctly!!'}
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
