class CarouselItemsController < ApplicationController
  # before_action :visitor!

  def index
    # if current_user.type == "Admin"
      @carousel_items = CarouselItem.all
    # else
    #   flash[:error] = "You don't rights to access this page"
    #   redirect_to root_path
    # end
  end


  def new
    # if current_user.type == "Admin"
      @carousel_item = CarouselItem.new()
    # else
    #   flash[:error] = "You don't rights to access this page"
    #   redirect_to root_path
    # end
  end

  def create
    # if current_user.type == "Admin"
    #   unless CarouselItem.all.size >= 5
        @carousel_item = CarouselItem.new(carousel_item_params)
        if @carousel_item.save!
          redirect_to root_path
        else
          flash[:errors] = "Something went wrong."
          redirect_to new_admin_carousel_item_path(current_user)
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
      @carousel_item = CarouselItem.find(params[:id])
      @carousel_item.destroy
      flash[:notice] = "Slice Deleted"
      redirect_to root_path
    # else
    #   flash[:error] = "You Have No Permissions to Delete This item. "
    #   redirect_to root_path
    # end
  end


  private

  def carousel_item_params
    params.require(:carousel_item).permit(:title, :body, :file_name)
  end
end
