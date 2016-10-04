 class ContactSharesController < ApplicationController
   def create
     contact_share = ContactShare.new(params[:contact_share], :user_id, :contact_id)
     if contact_share.save
       render json: contact
     else
       render(
         json: contact_share.errors.full_messages, status: :unprocessable_entity
       )
     end
   end

   def destroy
     contact_share = ContactShare.find(params[:id])
     contact_share.destroy
     render json: contact_share
   end
   
 end
