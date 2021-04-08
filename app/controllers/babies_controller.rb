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
    @event_last = Event.where(baby: @baby).order(:start_time).last
  end

  def details
    @baby = Baby.find(params[:baby_id])
    details_health
    details_sleep(params[:date_filter])
    details_diapers(params[:date_filter])
    details_milk(params[:date_filter])
  end

  def details_health
    if Event.where(type: "Poids").empty?
      @weight = Baby.find(params[:baby_id]).weight
    elsif 
      @weight = Event.where(type: "Poids").last.value_float
    end

    if Event.where(type: "Taille").empty?
      @height = Baby.find(params[:baby_id]).height
    elsif 
      @height = Event.where(type: "Taille").last.value_float
    end
  end

  def details_sleep(date_filter)
    if date_filter == "Mois dernier"
      number_of_days = 30
    elsif date_filter == "Semaine dernière"
      number_of_days = 7
    else
      number_of_days = 1
    end
    duration = 0
    @babyborn = @baby.events.where(type: "Dodo").where("start_time > ?", number_of_days.days.ago)
    @babyborn.each do |event|
      entry = event.calculate_sleep #if event.start_time.day == Date.today.day - number_of_days
      duration += entry
    end
    @sleep = duration
  end

  def details_diapers(date_filter)
    if date_filter == "Mois dernier"
      number_of_days = 30
    elsif date_filter == "Semaine dernière"
      number_of_days = 7
    else
      number_of_days = 1
    end
    sum = 0
    @babydiaper = @baby.events.where(type: "Couche").where("start_time > ?", number_of_days.days.ago)
    @babydiaper.each do |event|
        sum += 1
      end
    @diaper = sum
  end

  def details_milk(date_filter)
    if date_filter == "Mois dernier"
      number_of_days = 30
    elsif date_filter == "Semaine dernière"
      number_of_days = 7
    else
      number_of_days = 1
    end
    quantity = 0
    @babymilk = @baby.events.where(type: "Biberon").where("start_time > ?", number_of_days.days.ago)
    @babymilk.each do |event|
      entry = event.value_float
      quantity += entry
    end
    @milk = quantity
  end

  helper_method :age

  private

  def baby_params
    params.require(:baby).permit(:name, :birth_date, :weight, :height, :gender, :photo)
  end
end
