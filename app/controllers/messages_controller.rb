class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  def index
    if current_client
      @sent_messages = current_client.sent_messages
      @received_messages = current_client.received_messages
    else
      redirect_to login_path, flash: { alert: 'You have to be logged it to do that!!' }
    end
  end

  def show
  end

  def new
    if current_client
      @message = Message.new
    else
      redirect_to signup_path, flash: { alert: 'You have to be logged it to do that!!' }
    end
  end

  def create
    @receiver = Client.find_by(params[:username])
    @message = Message.new(messsage_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, flash: { success: 'Message was successfully sent.' }}
      else
        format.html { render :new, flash: { error: 'You must fill in all fields correctly!!' }}
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
