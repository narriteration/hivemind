class TextsController < ApplicationController
  before_filter :authorize
  before_action :set_text, only: [:show, :edit, :update, :destroy]


  def index
    @texts = Text.all
  end

  def show
    contactID = @text.contact_id
    @contactObject = Contact.find_by_id(contactID)
    @user = current_user
  end

  def new
    @text = Text.new
    @contacts = current_user.contacts
    @user = current_user.name
    @emotions_array = [
      "confused",
      "angry",
      "sad",
      "frustrated",
      "guilty",
      "anxious",
      "nervous",
      "pessimistic",
      "jealous",
      "lonely",
      "greedy",
      "hopeless",
      "blah",
      "pissed",
      "tired"
    ]
    @who_array = [
      "I",
      "you",
      "we"
    ]
    @timeframe_array = [
      "in the next few hours",
      "sometime today",
      "tonight",
      "sometime in the next few days",
      "sometime this week",
      "this weekend",
      "in the next few weeks",
      "this month",
      "in the next few months"
    ]
  end

  def edit
    @contacts = current_user.contacts
    @emotions_array = [
      "confused",
      "angry",
      "sad",
      "frustrated",
      "guilty",
      "anxious",
      "nervous",
      "pessimistic",
      "jealous",
      "lonely",
      "greedy",
      "hopeless",
      "blah",
      "pissed",
      "tired"
    ]
    @who_array = [
      "I",
      "you",
      "we"
    ]
    @timeframe_array = [
      "in the next few hours",
      "sometime today",
      "tonight",
      "sometime in the next few days",
      "sometime this week",
      "this weekend",
      "in the next few weeks",
      "this month",
      "in the next few months"
    ]
  end

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

  def destroy
    @text.destroy
    respond_to do |format|
      format.html { redirect_to texts_url, notice: 'Text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def trigger_sms_alerts

    text = Text.find(params[:id])

    # Define vars to access text associations
    contactID = text.contact_id
    @contactObject = Contact.find_by_id(contactID)

    # Define 2 vars: recipient phone and whole message
    contact_phone = @contactObject.phone
    whole_message = "Hey, I'm feeling #{text.emotion} and I need #{text.need}. Can #{text.who} #{text.action} #{text.timeframe}?"

    # Call send_message (private method), passing in two agmts
    send_message(contact_phone, whole_message)

    # Redirect after sent
    redirect_to pages_profile_path, notice: 'Woohoo, help is on the way!'

  end

  private

    def send_message(phoneTACO, textTACO)

      @twilio_number = +15304884366
      @client = Twilio::REST::Client.new('ACc5b4024806cf68a23a9f23ede4de8f2f', '85ad150d4157bd67d0bf2a4f688aa674')

      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => phoneTACO,
        :body => textTACO
      )
      puts message.to
    end

    def set_text
      @text = Text.find(params[:id])
    end

    def text_params
      params.require(:text).permit(:body, :signature, :emotion, :need, :who, :action, :timeframe, :contact_id)
    end
end
