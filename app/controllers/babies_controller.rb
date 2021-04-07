class BabiesController < ApplicationController
  def index
    @babies = Baby.joins(:baby_users).where("baby_users.user_id = #{current_user.id}")
    # @babies = Baby.all
  end

  def new
    @baby = Baby.new
  end

   def create
    @baby = Baby.new(baby_params)
    if @baby.save
      @baby_user =BabyUser.create(baby_id: @baby.id, user_id: current_user.id)
      @event = Event.new(type: "Evenement", value_string: "Bienvenue à #{@baby.name}", start_time: @baby.birth_date, baby_id: @baby.id, user_id: current_user.id)
      @event.photo = @baby.photo.blob
      @event.save!
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  def show
    @baby = Baby.find(params[:id])
    @age = @baby.age
    @event_last = Event.order(:start_time).last
  end

  helper_method :age

  private

  def baby_params
  params.require(:baby).permit(:name, :birth_date, :weight, :height, :gender, :photo)
end
end
