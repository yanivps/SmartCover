class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def contact_us
    redirect_to '/'
  end
end
