class CarouselItemsController < ApplicationController
  before_action :visitor!
  before_action :admin!

  def index
      @carousel_items = CarouselItem.all
  end


  def new
      @carousel_item = CarouselItem.new()
  end

  def create
     if current_user.admin?
        @carousel_item = CarouselItem.new(carousel_item_params)
        if @carousel_item.save!
          flash[:notice] = "Pic Added."
          redirect_to root_path
        else
          flash[:errors] = "Something went wrong."
          redirect_to root_path
        end
      else
        flash[:error] = "You don't rights to access this page"
        redirect_to root_path
     end
  end

  def destroy
    if current_user.admin?
      @carousel_item = CarouselItem.find(params[:id])
      @carousel_item.destroy
      flash[:notice] = "Slice Deleted"
      redirect_to root_path
    else
      flash[:error] = "You Have No Permissions to Delete This item. "
      redirect_to root_path
    end
  end


  private

  def carousel_item_params
    params.require(:carousel_item).permit(:title, :body, :file_name)
  end
end
