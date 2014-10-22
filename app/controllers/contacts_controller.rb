class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

  def show

  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.html
      format.json { render json: @contact }
    end

  end

  def create
    params.permit!
    @contact = Contact.new( params[:contact])
    @contact.client = current_user.company
    if(Lead.contact(@contact))

      respond_to do |format|
        format.html { redirect_to  "#{contacts_url}", notice: 'Contact was successfully created.' }
        #format.json { render json: @contact }
      end


    end
  end
end
