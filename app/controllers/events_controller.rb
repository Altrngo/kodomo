class EventsController < ApplicationController


def choose_type
  @types = ["BabyBottle", "Meal", "Sleep", "Diaper", "Wound", "Vaccine", "Temperature", "Drug", "Disease", "Weight", "Height", "OtherEvent"]
  @daily_types =["BabyBottle", "Meal", "Sleep", "Diaper"]
  @health_types = ["Wound", "Vaccine", "Temperature", "Drug", "Disease"]
  @other_event_types = ["OtherEvent"]
end


  def index
    @baby = baby.where(params[:baby_id])
    @event = event.all
  end

  def new
    @baby = Baby.find(params[:baby_id])
    @event = Event.new
  end

  def create
    @baby = Baby.find(params[:baby_id])
    @event = Event.new(event_params)
    @event.baby = @baby
    @event.user = current_user
    if @event.save
      redirect_to babies_path(@baby)
    else
      render :new
    end
  end

end
