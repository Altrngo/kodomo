class EventsController < ApplicationController

  def choose_type
    # @types = ["BabyBottle", "Meal", "Sleep", "Diaper", "Wound", "Vaccine", "Temperature", "Drug", "Disease", "Weight", "Height", "OtherEvent"]
    @daily_types =["BabyBottle", "Meal", "Sleep", "Diaper"]
    @health_types = ["Wound", "Vaccine", "Temperature", "Drug", "Disease"]
    @other_event_types = ["OtherEvent"]
  end

  def timeline
    @baby = Baby.find(params[:id])
    # @events = Event.where(baby: @baby).sort_by { |event| event.start_time}.reverse
    @events = Event.where(baby: @baby)
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


  private

  def event_params
    params.require(:event).permit(:type, :start_time, :end_time, :value_float, :value_string, :comment, :validated, :baby_id, :user_id)
  end

end
