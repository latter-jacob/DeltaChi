class FoundingFathersController < ApplicationController
  before_action :visitor!, except: [:index]
  before_action :admin!, except: [:index]

  def index
    @founding_fathers = FoundingFather.all
  end


  def new
    @founding_father = FoundingFather.new()
  end

  def create
    @founding_father = FoundingFather.new(founding_father_params)
    if @founding_father.save!
      redirect_to root_path
    else
      flash[:errors] = "Something went wrong."
      redirect_to root_path
    end
  end

  private

  def founding_father_params
    params.require(:founding_father).permit(:name, :details, :birthday, :deathday, :file_name)
  end
end
