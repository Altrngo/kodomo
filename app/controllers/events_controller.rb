class EventsController < ApplicationController


  def choose_type
    # @types = ["BabyBottle", "Meal", "Sleep", "Diaper", "Wound", "Vaccine", "Temperature", "Drug", "Disease", "Weight", "Height", "OtherEvent"]
    # @daily_types =["BabyBottle", "Meal", "Sleep", "Diaper"]
    # @health_types = ["Wound", "Vaccine", "Temperature", "Drug", "Disease"]
    # @other_event_types = ["OtherEvent"]

    @daily_types =["Biberon", "Repas", "Dodo", "Couche"]
    @health_types = ["Bobo", "Vaccin", "Témperature", "Médicament", "Maladie"]
    @other_event_types = ["Autre événement"]
  end


  def index
    @baby = baby.where(params[:baby_id])
    @event = event.all
  end

  def new
    @baby = Baby.find(params[:baby_id])
    @event = Event.new
    # raise
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
