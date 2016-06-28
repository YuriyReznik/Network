class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = current_user.primary_messages
  end

  def outbox
    @messages = current_user.primary_messages
  end

  def inbox
    @messages = current_user.secondary_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.errors.empty?
      redirect_to messages_outbox_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @message.update_attributes(message_params)
    if @message.errors.empty?
      redirect_to messages_outbox_path
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to :back
  end

  def find_message
    @message = Message.find_by(id: params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:user_1_id, :user_2_id, :content, :image)
  end

end
