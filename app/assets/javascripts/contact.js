

$(function(){
  $('#buttonSendEmail').click(function(e) {


   var selectedEmails = $("input[name=cbEmails]:checked").map(function () {return this.value;}).get().join(",");
   console.log(selectedEmails)
   sendEmail(selectedEmails);
   e.stopImmediatePropagation();
  });

  $("#cbAll").click(function(e) {
     console.log("clicked..."+this.checked)
      $('input:checkbox[name=cbEmails]').attr('checked', true);
     if(!this.checked) {
//            $(".cbEmails").attr("checked", true);
//            $("input:checkobx['cbEmails']").attr("checked", true);
//            $("input:checkobx['name']").attr('checked',true)
//              $('input:checkbox[name=cbEmails]').attr('checked', this.checked);
//     } else {
//          $(".cbEmails").attr("checked", false);
console.log("removed")
           $("#cbEmails").removeAttr("checked");
     }
   e.stopImmediatePropagation();
});

});
function sendEmail(emailString) {

    $.ajaxSetup({
        beforeSend: function(xhr) {

            xhr.setRequestHeader("Accept", "text/javascript");
//            xhr.setRequestHeader("Authorization", $.cookie('tviderAuthorization'));
            

        },
        data : {'emails' : emailString}
    });

    //Make Ajax call to fetch public timline
    $.getJSON('/contacts/send_email.json', function(data) {
            // Check weather status code.
            // if code is 0 then its success
            if (data.code == "0") {
               alert("email sent")
            }
        });
        
                    
}