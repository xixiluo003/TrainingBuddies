class EventsController < ApplicationController

  def index
    @happenings = find_happenings
    @events = @happenings.events
  end

  def create
    @happenings = find_happenings
    @event = @happenings.events.build(params[:event])
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


end
