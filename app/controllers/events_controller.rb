class EventsController < ApplicationController

  def index
    @happenings = find_happenings
    @events = @happenings.events
  end

  def new
    puts "\n ******* new_event *******"
    @happenings = find_happenings
    @usergroup = current_user.groups
    puts "@usergroup: #{@usergroup.inspect}"
    @workouts = Workout.where(user_id: current_user)
    puts "@workouts: #{@workouts.inspect}"
    @event = @happenings.events.build(params[:event])
  end

  def create
    puts "\n ******* create_event *******"
    @happenings = find_happenings
    @groups = Group.where(user_id: current_user)
    @workouts = Workout.where(user_id: current_user)
    @event = @happenings.events.build(event_params)
    if @event.save
      flash[:notice] = "Successfully created comment."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end

  private
  def find_happenings
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def event_params
    params.require(:event).permit(:user_id, :group_id, :workout_id, :start_event, :end_event, :location)
  end


end
