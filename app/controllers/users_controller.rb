class UsersController < ApplicationController

  def index
    puts "\n******* index *******"
    @all_users = User.all
    @groups = Group.all
    @usergroups = current_user.groups
    puts "\n******* usergroups: #{@usergroups.inspect} *******"

    if params[:search]
      @all_users = User.search(params[:search]).order("created_at DESC")
      puts "@all_users: #{@all_users.inspect}"
    else
      @all_users = User.all.order('created_at DESC')
      puts "@all_users: #{@all_users.inspect}"
    end

  end

  def add
    puts "\n******* add *******"
    UserGroup.create(user_id: params[:ids], group_id: @group.id, user_type: "Group Leader" )
  end

end
