class ContactsController < ApplicationController


  def index
    user_id = params[:user_id]
    contacts = Contact.find_by(user_id: user_id)
    render json: contacts
  end

  def create
    values = params[:contact].permit(:name, :email)
    values[:user_id] = params[:user_id]
    contact = Contact.new(values)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])
    if contact
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  def destroy

    contact = Contact.find(params[:id])
    contact.destroy

    render json: contact

  end
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end



end
