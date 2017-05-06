class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      redirect_to '/contacts'
    else
      redirect_to '/contacts/new'
      puts "Error, contact not saved"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :nickname, :phone, :city, :state, :approved, :user_id)
  end

end
