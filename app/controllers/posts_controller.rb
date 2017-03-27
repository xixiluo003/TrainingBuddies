class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    puts "\n******* index *******"
  end

  def
    new
  	puts "\n******* new_post *******"
  	@post = Post.new

  end

  def create
  	puts "\n******* create_post *******"
  	@post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to "/"
    end
  end

  private

  def set_post
    puts "******* set_params *******"
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :group_id, :title, :content)
  end

end
