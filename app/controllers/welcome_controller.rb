class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def contact_us
    # change to_email to smartmerge00@gmail.com
    mail_body = "Name: #{CGI::escapeHTML params['name']}<br>Phone: #{CGI::escapeHTML params['phone']}<br>Company: #{CGI::escapeHTML params['company']}<br>Field: #{CGI::escapeHTML params['field']}<br>Comments: #{CGI::escapeHTML params['comments']}"
    send_email(CGI::escapeHTML(params['name']), CGI::escapeHTML(params['email']), {to_email: 'yanivps123@gmail.com', bcc: 'yanivps2@gmail.com'}, "SmartCover contact request", mail_body)
    flash[:contact_us_result] = "Thank you!"
    redirect_to '/'
  end
end
