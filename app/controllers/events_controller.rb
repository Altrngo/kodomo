class EventsController < ApplicationController

  def choose_type
    # @types = ["BabyBottle", "Meal", "Sleep", "Diaper", "Wound", "Vaccine", "Temperature", "Drug", "Disease", "Weight", "Height", "OtherEvent"]
    # @daily_types =["BabyBottle", "Meal", "Sleep", "Diaper"]
    # @health_types = ["Wound", "Vaccine", "Temperature", "Drug", "Disease"]
    # @other_event_types = ["OtherEvent"]

    @daily_types =["Biberon", "Repas", "Dodo", "Couche"]
    @health_types = ["Bobo", "Vaccin", "Temperature", "Medicament", "Maladie", "Taille", "Poids"]
    @other_event_types = ["Evenement"]
  end

  def timeline
    @health_types = ["Bobo", "Vaccin", "Temperature", "Medicament", "Maladie", "Taille", "Poids"]
    @baby = Baby.find(params[:id])
    if params[:start_time].present?
      start_time = Date.parse(params[:start_time])
      @events = Event.where(baby: @baby).where(start_time: start_time.beginning_of_day..start_time.end_of_day).order(:start_time).reverse
    else
      @events = Event.where(baby: @baby).order(:start_time).reverse
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @baby = Baby.find(params[:baby_id])
    @event = Event.new
    @event.type = params["type"]
    # raise
  end

  def create
    @baby = Baby.find(params[:baby_id])
    @event = Event.new(event_params)
    @event.baby = @baby
    @event.user = current_user
    # raise
    if @event.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    raise
    @event = Event.find(params[:id])
    @event.update!(event_params)
    redirect_to event_timeline_baby_path(@event.baby)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to event_timeline_baby_path(@event.baby)
  end
  private

  def event_params
    params.require(:event).permit(:type, :start_time, :end_time, :value_float, :value_string, :comment, :validated, :baby_id, :user_id, :photo)
  end

end
