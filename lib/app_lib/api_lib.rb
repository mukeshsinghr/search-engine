module AppLib
  module ApiLib

    def initialize
      @errors = []
      @response = {:code => 0, :result => nil}
      @page_limit = 20
      @popular_page_limit = 15
      @api_authenticated_user = nil

      @response_codes =
              {
                      :success => 0,
                      :internal_error => 10,
                      :validation_error => 11,
                      :insufficient_params => 12,
                      :auth_error => 20,
                      :incorrect_auth => 21,
                      :unauthorized => 22,
                      :incorrect_user => 23,
                      :incorrect_pass => 24,
                      :signup_success => 25,
                      :signup_failure => 26,
                      :change_password_failure => 28,
                      :twitter_link_failure => 27,
											:facebook_link_failure => 29,
                      :chunk_init_success => 30,
                      :chunk_init_failed => 31,
                      :upload_in_progress => 32,
                      :upload_success => 33,
                      :upload_failed => 34,
                      :no_status_found => 40,
                      :no_comments_found => 51,
                      :multiple_errors => 99,
											:facebook_unlink_success =>35,
											:facebook_unlink_fail =>36,
											:twitter_unlink_success => 37,
											:twitter_unlink_fail =>38


              }

      @response_messages =
              {
                      :internal_error => "Booooo Aaaaahhhh! Something went wrong while processing your request.",
                      :auth_error => "Authorization credentials are missing!!",
                      :incorrect_auth => "Your username and password combination is incorrect.",
                      :incorrect_user => "Your username is not signed-up with us.",
                      :incorrect_pass => "Your password is incorrect.",
                      :unauthorized => "Access Denied!! You are not authorised to access this information.",
                      :signup_success => "Hurray! User successfully signed up!",
                      :signup_failure => "Balderdash! Errors in signup",
                      :chunk_init_success => "File upload in chunk is successfully initialised.",
                      :chunk_init_failed => "Initialization of file upload in chunks failed.",
                      :upload_in_progress => "File upload in chunk formats is in progress.",
                      :upload_success => "File is successfully uploaded.",
                      :upload_failed => "File upload is permanently failed.",
                      :upload_invalid_file => "Selected file is not a multimedia content.",
                      :no_status_found => "No status(es) were found for your criteria. May be deleted.",
                      :twitter_linked => "Twitter account was successfully linked!",
											:facebook_linked => "Facebook account was successfully linked!",
                      :twitter_link_failure => "Twitter account linking failed.",
											:facebook_link_failure => "Facebook account linking failed.",
                      :no_comments_found => "No comments were found for given tweet.",
                      :comment_delete_success => "Comment deleted successfully.",
                      :status_delete_success => "Tweet deleted successfully. ",
                      :change_password_success => "Password is successfully changed.",
                      :change_password_failure => "Change Password failed.",
											:facebook_unlink_success => "Facebook account was successfully unlinked!",
											:facebook_unlink_fail => "Facebook account unlinking failed.",
											:twitter_unlink_success => "Twitter account was successfully unlinked!",
											:twitter_unlink_fail => "Twitter account unlinking failed.",
              }
    end


    # Method to check whether the required parameters
    # for the execution of the api are present in the
    # request else it would be erroneous
    def required_params_present?(params, * parameters)
      parameters.each do |param|
        if params[param].blank?
          @response[:code] = @response_codes[:insufficient_params]
          @errors << "#{param.to_s.capitalize!} cannot be left blank"
        end
      end

      @errors.blank? ? true : false
    end


   
  # Method to handle the API exceptions
    def api_exception_handler(exception)
      logger.error exception
      @errors << exception.message
      @response[:code] = @response_codes[:internal_error]
    end


 
  end
end