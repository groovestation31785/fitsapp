class SessionsController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
    render "new"
  end

  def create
    @client = Client.find_by(username: params_username)
    if @client && @Client.authenticate(params_password)
      log_in(@client)
      render ''
    else
      flash[:notice] = "You must be logged in with proper credentials"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/'
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
