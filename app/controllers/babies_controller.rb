class BabiesController < ApplicationController
  def index
    @babies = Baby.all
  end

  def new
    @baby = Baby.new
  end

   def create
    @baby = Baby.new(baby_params)
    if @baby.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  def show
    @baby = Baby.find(params[:id])
  end
  

  private

  def baby_params
  params.require(:baby).permit(:name, :birth_date, :weight, :height, :gender, :photo)
end
end
