class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
	# list all users
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  # displays a user profile
  def profile
  	@user = User.where(username: params[:username])
  end

  def create
  	@user = User.create(params[:user])
  	redirect_to @user, notice: "New user created." # @user is the same as user_path(@user.id)
  end

  def update
  	@user.update(params[:user])
  	redirect_to @user, notice: "User successfully updated."
  end

  def destroy
  	@user.destroy
  	redirect_to users_path, notice: "User deleted."
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

end
