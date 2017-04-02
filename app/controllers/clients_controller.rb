class ClientsController < ApplicationController
  def new
    @client = Client.new
    render 'new'
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      log_in @client
      redirect_to messages_path, flash[:success] = "You are now logged in!"
    else
      redirect_to signup_path, notice: "You must give the correct information to continue!"
    end
  end

  private
   def client_params
     params.require(:client).permit(:name, :email, :username, :password)
   end
end
