class Admin::UsersController < ApplicationController
  before_action :admin_access
  before_action :fetch_user, except: [:index, :new, :create]

  def index
    @users = User.order(id: :desc).page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'Created new user'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User updated'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def mail_info
    AdminMailer.user_info(current_admin, @user).deliver_now
    redirect_to admin_user_path(@user), notice: 'Email sent'
  end

  private

  def user_params
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    params.require(:user).permit(:full_name, :email, :bio, :birth_date, :avatar, :password, :password_confirmation)
  end

  def fetch_user
    @user = User.find(params[:id])
  rescue
    not_found!
  end

  def admin_access
    redirect_to root_path, notice: "You don't have admin access" unless current_admin
  end
end
