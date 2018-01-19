class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def contact_us
    # change to_email to smartmerge00@gmail.com
    mail_body = "Name: #{params['name']}<br>Phone: #{params['phone']}<br>Company: #{params['company']}<br>Field: #{params['field']}<br>Comments: #{params['comments']}"
    send_email(params['name'], params['email'], {to_email: 'yanivps123@gmail.com', bcc: 'yanivps2@gmail.com'}, "SmartCover contact request", mail_body)
    flash[:contact_us_result] = "Thank you!"
    redirect_to '/'
  end
end
