class HomesController < ApplicationController
  def index
    @contact = Contact.new
    @carousel_items = CarouselItem.all
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = "Your message has been sent."
      redirect_to root_path
    else
      flash[:errors] = @contact.errors.full_messages
      redirect_to new_contact_path
    end
  end
end
