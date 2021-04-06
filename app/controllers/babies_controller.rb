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
      BabyUser.create(baby_id: @baby.id, user_id: current_user.id)
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  def show
    @baby = Baby.find(params[:id])
    @age = @baby.age
  end

  def details
    @baby = Baby.find(params[:baby_id])
    if Event.where(type: "Poids") != nil
     @weight = Event.where(type: "Poids").last.value_float
   elsif
      @weight = Baby.find(params[:baby_id]).weight
   end

   if Event.where(type: "Taille") != nil
    @height = Event.where(type: "Taille").last.value_float
  elsif
    @height = Baby.find(params[:baby_id]).height
  end
  end

  helper_method :age

  private

  def baby_params
    params.require(:baby).permit(:name, :birth_date, :weight, :height, :gender, :photo)
  end
end
