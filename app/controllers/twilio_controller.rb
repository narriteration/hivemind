require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  # disable Rails-generated CSRF protection
  # that allows our app to be POSTed to (might not need)
  skip_before_action :verify_authenticity_token
