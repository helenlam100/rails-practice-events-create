class EventsController < ActionController::Base

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def event_params
    params.require(:event).permit(
    :date,
    :description,
    :requires_id,
    :capacity,
    :directions,
    )
  end
end
