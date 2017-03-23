class GroupsController < ApplicationController
	before_action :set_group, only: [:show, :edit, :update, :destroy]

  # ======= GET / =======
  def index
    puts "\n******* index *******"
  end

  def home
    puts "\n******* home *******"
    @group = Group.all
    @usergroup = current_user.groups
    puts "@usergroup: #{@usergroup.inspect}"
  end


  def show
    puts "\n******* show *******"
    @group = Group.find(params[:id])
    puts "@group: #{@group.inspect}"
    @users = @group.users
    puts "@users: #{@users.inspect}"
    @events = Event.where(group_id: @group)
    puts "\n****** @events: #{@events.inspect}"
  end



private
  def set_group
    puts "******* set_params *******"
    @group = Group.find(params[:id])
  end

	def group_params
		puts "******* group_params *******"
		# params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
