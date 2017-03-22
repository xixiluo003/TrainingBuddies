class GroupsController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  # ======= GET / =======
  def index
    puts "\n******* index *******"
  end

  def home
    puts "\n******* home *******"
  end

private
	def group_params
		puts "******* group_params *******"
		# params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
