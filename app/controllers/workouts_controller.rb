class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    puts "\n******* index *******"
  end

  def
    new
    puts "\n******* new_workout *******"
    @workout = Workout.new

  end

  def create
    puts "\n******* create_post *******"
    @workout = Workout.new(workout_params)
    if @workout.save
      flash[:notice] = "Successfully created post."
      redirect_to "/"
    end
  end

  private
  def set_workout
    puts "******* set_params *******"
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:user_id, :workout_name, :workout_type, :workout_content)
  end

end
