

$(function(){
  $('#buttonSendEmail').click(function(e) {


   var selectedEmails = $("input[name=cbEmails]:checked").map(function () {return this.value;}).get().join(",");
   console.log(selectedEmails)
   sendEmail(selectedEmails);
   e.stopImmediatePropagation();
  });
});
function sendEmail(emailString) {

    $.ajaxSetup({
        beforeSend: function(xhr) {

            xhr.setRequestHeader("Accept", "text/javascript");
//            xhr.setRequestHeader("Authorization", $.cookie('tviderAuthorization'));
            data : { emails : emailString }

        }
    });

    //Make Ajax call to fetch public timline
    $.getJSON('/contacts/send_email.json', function(data) {
            // Check weather status code.
            // if code is 0 then its success
            if (data.code == "0") {
                //Pass result to showTweetTimeline method to populate
                showUserTweetTimeline(data.result);
            // showTweetTimeline(data.result);
            }
        });
        
                    
}