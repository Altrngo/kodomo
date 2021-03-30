class EventsController < ApplicationController


def choose_type
  @types = ["BabyBottle", "Meal", "Sleep", "Diaper", "Wound", "Vaccine", "Temperature", "Drug", "Disease", "Weight", "Height", "OtherEvent"]
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

  # class BabyBottle < EventsController
    
  # end

  # class Meal < EventsController
    
  # end

  # class Sleep < EventsController
    
  # end

  # class Diaper < EventsController
    
  # end

  # class Wound < EventsController
    
  # end

  # class Vaccine < EventsController
    
  # end

  # class Temperature < EventsController
    
  # end

  # class Drug < EventsController
    
  # end

  # class Disease < EventsController
    
  # end

  # class Weight < EventsController
    
  # end

  # class Height < EventsController
    
  # end

  # class OtherEvent < EventsController
    
  # end

end
