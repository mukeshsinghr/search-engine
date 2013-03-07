class ContactsController < ApplicationController
  #  OpenSSL::SSL::VERIFY_NONE
  include AppLib::ApiLib
  def gmail_contact
    puts "params:#{params}"
    if Rails.env.development?
      OpenSSL::SSL::VERIFY_NONE
    end
    #    end
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

  def send_email

    api_respond_to(@response, @errors)

  rescue Exception => e
    api_exception_handler(exception)
  end
end
