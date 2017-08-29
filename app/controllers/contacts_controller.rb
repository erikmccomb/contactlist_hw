class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contacts_params)
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def destroy
    contact = Contact.find(params[:id]).destroy
    redirect_to contacts_path
  end

  private
    def contacts_params
      params.require(:contact).permit(:name, :phone, :email)
    end
end
