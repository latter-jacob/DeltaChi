class ExecsController < ApplicationController
  before_action :visitor!
  before_action :admin!

  def index
    @execs = Exec.all
  end


  def new
    @exec = Exec.new()
  end

  def create
    @exec = Exec.new(exec_params)
    if @exec.save!
      redirect_to root_path
    else
      flash[:errors] = "Something went wrong."
      redirect_to root_path
    end
  end

  def edit
    @exec =Exec.find(params[:id])
  end

  def update
    @exec =Exec.find(params[:id])
    @exec.update_attributes(exec_params)
    flash[:success] = 'Exec edited successfully'
    redirect_to execs_path
  end

  def destroy
    @exec = Exec.find(params[:id])
    @exec.destroy
    flash[:notice] = "Exec Deleted"
    redirect_to root_path
  end


  private

  def exec_params
    params.require(:exec).permit(:name, :title, :file_name)
  end
end
