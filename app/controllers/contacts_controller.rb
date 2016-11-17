class ContactsController < ApplicationController
  before_action :visitor!, except: [:new, :create]
  before_action :admin!, except: [:new, :create]

  def new
    @contact = Contact.new
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

  def index
    @contacts = Contact.all.sort_by{|contact| contact.created_at}
  end

  def destroy
    @contact = Contact.find(params[:id])
    if current_user.admin?
      @contact.destroy
      flash[:notice] = "Message Deleted"
      redirect_to contacts_path
    else
      flash[:error] = "You Have No Permissions to Delete This Message. "
      redirect_to contacts_path
    end
  end

  private

  def contact_params
     params.require(:contact).permit( :message, :email )
  end
end
