class CommentsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    puts "\n******* index *******"
  end

  def
    new
    puts "\n******* new_post *******"
    @comment = Comment.new

  end

  def create
    puts "\n******* create_post *******"
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Successfully created post."
      redirect_to "/"
    end
  end

  private
  def set_comment
    puts "******* set_params *******"
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end


end
