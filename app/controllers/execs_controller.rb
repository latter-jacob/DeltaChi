class ExecsController < ApplicationController
  # before_action :visitor!

  def index
    # if current_user.type == "Admin"
      @execs = Exec.all
    # else
    #   flash[:error] = "You don't rights to access this page"
    #   redirect_to root_path
    # end
  end


  def new
    # if current_user.type == "Admin"
      @exec = Exec.new()
    # else
    #   flash[:error] = "You don't rights to access this page"
    #   redirect_to root_path
    # end
  end

  def create
    # if current_user.type == "Admin"
    #   unless CarouselItem.all.size >= 5
        @exec = Exec.new(exec_params)
        if @exec.save!
          redirect_to root_path
        else
          flash[:errors] = "Something went wrong."
          redirect_to root_path
        end
    #   else
    #     flash[:errors] = "You have reached the limit of slides for the carousel, please delete one if you want to add new ones."
    #     redirect_to new_admin_carousel_item_path(current_user)
    #   end
    # else
    #   flash[:error] = "You don't rights to access this page"
    #   redirect_to root_path
    # end
  end

  def destroy
    # if current_user.type == "Admin"
      @exec = Exec.find(params[:id])
      @exec.destroy
      flash[:notice] = "Exec Deleted"
      redirect_to root_path
    # else
    #   flash[:error] = "You Have No Permissions to Delete This item. "
    #   redirect_to root_path
    # end
  end


  private

  def exec_params
    params.require(:exec).permit(:name, :title, :file_name)
  end
end
