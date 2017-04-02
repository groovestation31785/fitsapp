class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  def index
    # if logged in, find sent messages and received messages with the current user's id
    # set that to @messages
  end

  def show
  end

  def new
    if current_user
      @comment = Comment.new
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js {render json: @comment.to_json}
        format.html { redirect_to pin_path(@pin), notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_pin
      @pin = Pin.find(params[:pin_id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :content, :pin_id)
    end
end
