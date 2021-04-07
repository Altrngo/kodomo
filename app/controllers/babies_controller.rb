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
    details_health
    details_sleep
    details_diapers
  end

  def details_health
    if Event.where(type: "Poids") != nil
      @weight = Event.where(type: "Poids").last.value_float
    elsif @weight = Baby.find(params[:baby_id]).weight
    end

    if Event.where(type: "Taille") != nil
      @height = Event.where(type: "Taille").last.value_float
    elsif @height = Baby.find(params[:baby_id]).height
    end
  end

  def details_sleep
    duration = 0
    @babyborn = @baby.events.where(type: "Dodo")
    @babyborn.each do |event|
      entry = 0
      entry = event.calculate_duration if event.start_time.day == Date.today.day - 1
      duration += entry.to_i
    end
    @sleep = duration
  end

  def details_diaper
    sum = 0
    @babydiaper = @baby.events.where(type: "Couche")
    @babydiaper.each do |event|
      entry = 0
      entry = event.calculate_duration if event.start_time.day == Date.today.day - 1
      duration += entry.to_i
    end
    @diaper = sum
  end

  helper_method :age

  private

  def baby_params
    params.require(:baby).permit(:name, :birth_date, :weight, :height, :gender, :photo)
  end
end
