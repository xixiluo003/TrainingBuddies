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
      flash[:notice] = "Successfully created event."
      redirect_to "/"
    else
      render :action => 'new'
    end
  end

  def edit
    puts "\n ******* edit_event *******"
    puts "params: #{params.inspect}"
    @event = Event.find(params[:id])
    puts "@event: #{@event.inspect}"
    @usergroup = current_user.groups
    @workouts = Workout.where(user_id: current_user)
  end

  def update
    @event = Event.find(event_params[:id])
    if @event.update(event_params)
      flash[:notice] = "Successfully updated event."
      redirect_to "/"
    else
      puts "Didn't work"
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
    params.require(:event).permit(:user_id, :id, :group_id, :workout_id, :title, :start, :end, :event_location, :color)
  end


end
