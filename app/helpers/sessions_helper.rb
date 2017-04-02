module SessionsHelper

  def current_client
    @current_client ||= User.find_by_id(session[:client_id]) if session[:client_id]
  end

  def logged_in?
    current_client
  end

  def log_in(client)
    session[:client_id] = client.id
  end

  def log_out
    session.delete(:client_id)
    @current_client = nil
  end

end
