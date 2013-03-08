class ApplicationController < ActionController::Base
  protect_from_forgery

   # Method to create a response to api requests
  def api_respond_to(response, errors)
    response = create_response(response, errors)

    respond_to do |format|
      format.html {}
      format.json { render :json => response.to_json, :callback => params[:callback], :content_type => "text/html" }
      format.xml { render :xml => response }
    end
  end

 # Method that creates response
  def create_response(response, errors)
    response[:code] = 99 if errors.length > 1
    unless errors.empty?
      long_error = ""
      errors.each do |error|
        long_error += "#{error}\n"
      end
      response[:result] = long_error
    end

    return response
  end

  def create_error(long_error)
    resp_error = {:errorMessage => nil, :errorCode => nil}

    resp_error[:errorMessage] = long_error

    return resp_error
  end

  def host_url
     request.protocol + request.host_with_port
  end
end
