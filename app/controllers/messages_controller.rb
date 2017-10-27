class MessagesController < ApplicationController
  def index
    @sent = Message.where(sender: current_user)
    @received = Message.where(recipient: current_user)
  end

  def new
    if params[:user_id]
      @recipient = User.find(params[:user_id])
    end  
    q1 = current_user.friends
    q2 = current_user.users
    @others = q1 + q2 

  end

  def create
    m = Message.new
    m.content = params[:content]
    m.sender = current_user
    m.recipient = User.find(params[:recipient])
    m.save
    return redirect_to messages_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
