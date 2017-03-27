class GroupsController < ApplicationController
	before_action :set_group, only: [:show, :edit, :update, :destroy]

  # ======= GET / =======
  def index
    puts "\n******* index *******"
  end

  def home
    puts "\n******* home *******"
    @groups = Group.all
    @usergroup = current_user.groups
    puts "@usergroup: #{@usergroup.inspect}"
  end


  def show
    puts "\n******* show *******"
    @group = Group.find(params[:id])
    # puts "@group: #{@group.inspect}"
    @users = @group.users
    # puts "@users: #{@users.inspect}"
    @events = Event.where(group_id: @group)
    # puts "\n****** @events: #{@events.inspect}"
		@posts = @group.posts
		# puts "@posts: #{@posts.inspect}"
		@post = Post.new
		@comments = Comment.where(post_id: @posts)
		@comment = Comment.new
  end

def new
	puts "\n******* new_group *******"
	@group = Group.new
end

def create
	puts "\n******* create_group *******"
	@group = Group.new(group_params)
end

private
  def set_group
    puts "******* set_params *******"
    @group = Group.find(params[:id])
  end

	def group_params
		puts "******* group_params *******"
		params.require(:group).permit(:group_name, :group_leader, :group_type, :group_goal)
	end
end
