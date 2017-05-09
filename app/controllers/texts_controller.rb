class TextsController < ApplicationController
  before_filter :authorize
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
    contactID = @text.contact_id
    @contactObject = Contact.find_by_id(contactID)
  end

  # GET /texts/new
  def new
    @text = Text.new
    @contacts = current_user.contacts
  end

  # GET /texts/1/edit
  def edit
    @contacts = current_user.contacts
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = Text.new(text_params)

    respond_to do |format|
      if @text.save
        format.html { redirect_to @text, notice: 'Text was successfully created.' }
        format.json { render :show, status: :created, location: @text }
      else
        format.html { render :new }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    @contacts = current_user.contacts
    respond_to do |format|
      if @text.update(text_params)
        format.html { redirect_to @text, notice: 'Text was successfully updated.' }
        format.json { render :show, status: :ok, location: @text }
      else
        format.html { render :edit }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text.destroy
    respond_to do |format|
      format.html { redirect_to texts_url, notice: 'Text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  def trigger_sms_alerts

    puts "trigger sms running"

    text = Text.find(params[:id])
    puts "text is #{text}"

    # Define vars (also defined in show method)
    contactID = text.contact_id
    @contactObject = Contact.find_by_id(contactID)

    puts "phone number trying to send to: ", @contactObject.phone
    puts "partial body of text: ", text.emotion

    # Define vars for only this method
    whole_message = text.emotion
    contact_phone = @contactObject.phone

    # Call send_message (private), passing in two agmts
    send_message(contact_phone, whole_message)

  end





  private

    def send_message(phoneTACO, textTACO)

      puts "the send message is happening"

      @twilio_number = +15304884366
      @client = Twilio::REST::Client.new('ACc5b4024806cf68a23a9f23ede4de8f2f', '85ad150d4157bd67d0bf2a4f688aa674') #TODO: convert to local ENV variable, then config with heroku

      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => phoneTACO,
        :body => textTACO
      )
      puts message.to
    end





    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:body, :signature, :emotion, :need, :who, :action, :timeframe, :contact_id)
    end
end
