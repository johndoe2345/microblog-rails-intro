class CommentsController < ApplicationController
  before_action :set_post, only: [:edit, :create, :update, :show, :destroy]
  def index
    @comments = Comment.all
    @recent = Comment.order("created_at DESC")
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def show
    
  end

  #this is maybe right
  def create
    @comment = @post.comments.new(comment_params.merge(user_id: current_user.id, post_id: params[:post_id]))
    if @comment.save
      redirect_to :back, notice: "New comment posted."
    else
      flash[:alert] = "Something went wrong."
      redirect_to :back
    end
  end

  def update
    @comment.update(comment_params)
    redirect_to :back, notice: "Comment successfully updated."
  end

  def destroy
    @comment.destroy
    redirect_to :back, notice: "Comment deleted."
  end

  private

  #this is maybe right
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :image, :post_id, :user_id)
  end

end
