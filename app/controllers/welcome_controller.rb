class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def contact_us
    
    flash[:contact_us_result] = "Thank you!"
    redirect_to '/'
  end
end
