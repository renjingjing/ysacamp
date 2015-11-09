class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
    if can? :admin , current_user
      @contacts = Contact.all
      if params[:search]
          @contacts = Contact.search(params[:search]).order("#{params[:order]}")
      else
          @contacts = Contact.order("#{params[:order]}")
      end
    end
  end

  def new
    @contact  = Contact.new
  end

  def show
    @contact  = Contact.find params[:id]
    if current_user.email1 != @contact.email
      flash[:alert] = "Can't show contact information！"
      redirect_to new_contact_path
    end
  end

  def create
    @contact        =   Contact.new contact_params
    @contact.name   =   current_user.full_name
    @contact.email  =   current_user.email1
    if @contact.save
      redirect_to contact_path(@contact)
      flash[:notice] = "Contact succeeded"
    else
      flash[:alert] = "Can't contact！"
      render contacts_path
    end
    # render text: "Thank you for contacting us!"
    # render :create, layout: "application"
  end

  def update
   if can? :admin , current_user
     @contact  = Contact.find params[:id]
     @contact.done = true
   end
   end

  private

  def contact_params
    params.require(:contact).permit(:message)
  end

end
