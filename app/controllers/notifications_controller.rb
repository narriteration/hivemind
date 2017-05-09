class NotificationsController < ApplicationController

  def trigger_sms_alerts

    print "HELLO I AM ALIVE"
    @test_contact = current_user.contacts.find_by_id(params[:id])
    print @test_contact

    @contact_text = @test_contact.texts.find_by_id(params[:id])
    print @contact_text

    @alert_message = @contact_text
    print @alert_message

    @test_contact.each do |contact|
      begin
        phone_number = contact.phone
        send_message(phone_number, @alert_message)
        flash[:success] = "Your text was sent!"
      rescue
        flash[:alert] = "Something went wrong."
      end
    end

  end

  def index
  end

  private

    def send_message(phone_number, alert_message)
      puts "the send message is happening"

      @twilio_number = +15304884366
      @client = Twilio::REST::Client.new('ACc5b4024806cf68a23a9f23ede4de8f2f', '85ad150d4157bd67d0bf2a4f688aa674') #TODO: convert to local ENV variable, then config with heroku

      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => phone,
        :body => alert_message
      )
      puts message.to
    end

end
