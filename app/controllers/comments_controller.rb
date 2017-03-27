class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    puts "\n******* index *******"
  end

  def
    new
    puts "\n******* new_comment *******"
    @comment = Comment.new

  end

  def create
    puts "\n******* create_comment *******"
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Successfully created comment."
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
