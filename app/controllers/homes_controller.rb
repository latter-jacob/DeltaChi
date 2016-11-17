class HomesController < ApplicationController
  def index
    @contact = Contact.new
    @carousel_items = CarouselItem.all
    @president = Exec.order("created_at ASC").first
    @eletes = Exec.order("created_at ASC").limit(4).offset(1)
    @others = Exec.order("created_at ASC").offset(5)
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
