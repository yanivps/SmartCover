class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def contact_us
    mail_body = "Name: #{CGI::escapeHTML params['name']}<br>Phone: #{CGI::escapeHTML params['phone']}<br>Company: #{CGI::escapeHTML params['company']}<br>Field: #{CGI::escapeHTML params['field']}<br>Comments: #{CGI::escapeHTML params['comments']}"
    begin
      send_email(CGI::escapeHTML(params['name']), CGI::escapeHTML(params['email']), {to_email: 'smartmerge00@gmail.com', bcc: 'yanivps2@gmail.com'}, "SmartCover contact request", mail_body)
      flash[:contact_us_result] = "Thank you!"
    rescue => e
      Rails.logger.error "Failed send email with error: #{e.message}\nMessage body: Name: #{params[:name]} Email: #{params[:email]} MailBody: #{mail_body}"
      flash[:contact_us_result] = "There was an error. Please try again later"
    end
    redirect_to '/'
  end
end
