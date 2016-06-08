class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      redirect_to users_path(@user)
    else
      render 'new'
    end
  end

  def update
    @user.update_attributes(user_params)
    if @user.errors.empty?
      redirect_to users_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to action: 'index'
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def profile
    @user = current_user
  end

  def users_friends
    @user = current_user
  end


  private
  def user_params
    params.require(user).permit(
        :email,
        :encrypted_password,
        :reset_password_token,
        :reset_password_sent_at,
        :remember_created_at,
        :sign_in_count,
        :current_sign_in_at,
        :last_sign_in_at,
        :current_sign_in_ip,
        :last_sign_in_ip,
        :created_at,
        :updated_at,
        :avatar,
        :username)
  end

end
