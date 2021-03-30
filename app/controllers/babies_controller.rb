class BabiesController < ApplicationController
  def index
    @babies = Baby.all
  end

  private

  def baby_params
  params.require(:baby).permit(:name, :birth_date, :weight, :height, :gender, :photo)
end
end
