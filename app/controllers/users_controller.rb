class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy, :follow, :unfollow, :search]
	# list all users
  def index
  	if params[:query]
      @users = User.where(["username = ? or fname = ? or lname = ? or username = ? or fname = ? or lname = ? or username = ? or fname = ? or lname = ? or username = ? or fname = ? or lname = ?", params[:query], params[:query], params[:query], params[:query].capitalize, params[:query].capitalize, params[:query].capitalize, params[:query].upcase, params[:query].upcase, params[:query].upcase, params[:query].downcase, params[:query].downcase, params[:query].downcase])
    else
      @users = User.all
    end
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def show
  end

  def follow
    Follow.create(followee_id: params[:id], follower_id: current_user.id)
    redirect_to @user, notice: "Followed!"
  end

  def unfollow
    Follow.where(followee_id: params[:id], follower_id: current_user.id).first.destroy
    redirect_to @user, notice: "Unfollowed!"
  end

  def create
    @user = User.new(user_params)
  	if @user.save
      session[:id] = @user.id
    	redirect_to @user, notice: "New user created." # @user is the same as user_path(@user.id)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def update
  	if @user.update(user_params)
    	redirect_to @user, notice: "User successfully updated."
    else
      flash[:alert] = "Something went wrong."
      render :edit
    end
  end

  def destroy
    if session[:id] == @user.id
      session[:id] = nil
    	@user.destroy
    	redirect_to root_path, notice: "User deleted."
    else
      redirect_to root_path, alert: "Unable to process request"
    end
  end

  private

  def set_user
    if !params[:id].nil?
      @user = User.find(params[:id])
    else
      @user = User.find_by(username: params[:username])
    end
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :username, :about_me, :avatar)
  end

end
