class SessionsController < ApplicationController
  def new
    @client = Client.new
    render "new"
  end

  def create
    @client = Client.find_by(username: params_username)
    if @client && @client.authenticate(params_password)
      log_in(@client)

    else
      redirect_to signup_path, notice: "You must use the proper credentials"
    end
  end

  def destroy
    log_out
    redirect_to signup_path, notice: 'You are now logged out!!'
  end

  private
  def params_username
    session_params[:username]
  end

  def params_password
    session_params[:password]
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
