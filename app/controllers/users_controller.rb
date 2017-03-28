class UsersController < ApplicationController

  def index
    puts "\n******* index *******"
    @all_users = User.all

    if params[:search]
      @all_users = User.search(params[:search]).order("created_at DESC")
      puts "@all_users: #{@all_users.inspect}"
    else
      @all_users = User.all.order('created_at DESC')
      puts "@all_users: #{@all_users.inspect}"
    end

  end

end
