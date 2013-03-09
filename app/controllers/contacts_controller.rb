class ContactsController < ApplicationController
  #  OpenSSL::SSL::VERIFY_NONE
  include AppLib::ApiLib
  
  def gmail_contact
    puts "params:#{params}"
    if Rails.env.development?
      OpenSSL::SSL::VERIFY_NONE
    end
    @contacts = request.env['omnicontacts.contacts']
    puts "List of contacts obtained from #{params[:importer]}:"
    @contacts.each do |contact|
      puts "Contact found: name => #{contact[:name]}, email => #{contact[:email]}"
    end
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']
    puts "List of contacts obtained from #{params[:importer]}:"
    @contacts.each do |contact|
      puts "Contact found: name => #{contact[:name]}, email => #{contact[:email]}"
    end
    respond_to do |format|
			format.html
      format.json { }
		end
  end

  def gmail
    if Rails.env.development?
      OpenSSL::SSL::VERIFY_NONE
    end
    #    :ssl => {:ca_file => "/usr/lib/ssl/certs/ca-certificates.crt"
    #    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    c = Contacts::Gmail.new("testparadigm@gmail.com", "creatives").contacts
    puts "contacts are:#{c.inspect}"
  end

  def yahoo
    #    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    puts "yahoo:#{params}"
    c = Contacts::Yahoo.new("test_paradigm@yahoo.com", "creatives").contacts
    puts "contacts are:#{c.inspect}"
  end

  def report
    puts "-----report"
    pdf = Prawn::Document.new
    pdf.text "Hello World"
    filename = File.join(Rails.root, "app/report", "x.pdf")
    pdf.render_file filename
    send_file filename, :filename => "x.pdf", :type => "application/pdf"
  end

  def test
    puts "sending email"
     subject   =  "This is freindly email subject"
        body = "This is email body"
        AppMailer.send_email("mukesh_s_r@yahoo.co.in", "raghava.sangars@gmail.com", subject, body).deliver!
     api_respond_to(@response, @errors)

  rescue Exception => e
    api_exception_handler(exception)
  end

  def send_email
       puts "host_url:#{host_url}"
       to_email_list = params[:emails].split(',')
          subject   =  "This is freindly email subject"
        body = "This is email body"
        puts "Email sending to : #{to_email_list}"
        AppMailer.send_email(to_email_list, "mukeshsinghr@gmail.com", subject, body).deliver!
        @response[:result] = "mail sent"
    api_respond_to(@response, @errors)

  rescue Exception => e
    api_exception_handler(e)
  end
end
