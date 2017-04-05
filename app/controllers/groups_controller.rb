class GroupsController < ApplicationController
	before_action :set_group, only: [:show, :edit, :update, :destroy]

  # ======= GET / =======
  def index
    puts "\n******* index *******"

		@all_users = User.all
		if params[:search]
			@all_users = User.search(params[:search]).order("created_at DESC")
		else
			@all_users = User.all.order('created_at DESC')
		end

  end

  def home
    puts "\n******* home *******"
    @groups = Group.all
    @usergroup = current_user.groups
    puts "@usergroup: #{@usergroup.inspect}"
		puts "current_user: #{current_user.inspect}"

		@all_users = User.all
		if params[:search]
			@all_users = User.search(params[:search]).order("created_at DESC")
		else
			@all_users = User.all.order('created_at DESC')
		end
  end


  def show
    puts "\n******* show_group *******"
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

def getevents
	puts "\n******* getevents *******"
	puts "params: #{params.inspect}"
	@group = Group.find(params[:group_id])
	@events = Event.where(group_id: @group)

	respond_to do |format|
		format.json {render :json => @events}
	end
end

def new
	puts "\n******* new_group *******"
	@group = Group.new
end

def create
	puts "\n******* create_group *******"

	@group = Group.new(group_params)
	if @group.save
		flash[:notice] = "Successfully created group."
		UserGroup.create(user_id: current_user.id, group_id: @group.id, user_type: "Group Leader" )
		redirect_to "/"
	end
end

private
  def set_group
    puts "******* set_params *******"
    @group = Group.find(params[:id])
  end

	def group_params
		puts "******* group_params *******"
		params.require(:group).permit(:group_name, :user_id, :group_type, :group_goal)
	end

end
