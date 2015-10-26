class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def create
    @post = Post.create(params[:post].merge(user_id: current_user.id))
    # also could have done:
    # @post = Post.new(params[:post])
    # @post.user = current_user
    # @post.save
    
    redirect_to @post, notice: "New post created."
  end

  def update
    @post.update(params[:post])
    redirect_to @post, notice: "Post successfully updated."
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
