class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'sendgrid-ruby'
  include SendGrid


  def send_email(from_name, from_email, to_email, subject, body)

    if to_email.is_a?(Hash)
      to_email_str = to_email[:to_email]
      bcc = to_email[:bcc]
    else
      to_email_str = to_email
    end
    from = Email.new(name: from_name, email: from_email)
    to = Email.new(email: to_email_str)
    content = Content.new(type: 'text/html', value: "<html><body>#{body}</body></html>")
    personalization = Personalization.new
    personalization.add_to(to)
    personalization.add_bcc(Email.new(email: bcc)) if bcc

    mail = Mail.new
    mail.from = from
    mail.subject = subject
    mail.add_content(content)
    mail.add_personalization(personalization)
    

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
