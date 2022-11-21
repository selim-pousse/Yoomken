$(document).ready(function() { 
	$("#send_newpass").validate({
			errorElement: "em",
			errorContainer: $("#warning, #summarypass"),
			errorPlacement: function(error, element) {
				error.appendTo( $('#summarypass .red-left'));
			},
			rules: {
				pseudo: {
					required: true
					/*remote:'/ajax/isEmailPseudo'*/
				}
			},
			messages: {
				pseudo : {
					required: label.login_email_pseudo,
					remote : label.notexist_email_pseudo
				}
			},
			submitHandler: function(form) {
				var myDate = new Date();
				var offset = myDate.getTimezoneOffset();
				jQuery(form).ajaxSubmit({
					dataType:  'json', 
					success:   sendpass,
					data : {date:offset}
				});
			}
		});
		
		$("#reset_newpass").validate({
			errorElement: "em",
			errorContainer: $("#warning, #summaryresetpass"),
			errorPlacement: function(error, element) {
				error.appendTo( $('#summaryresetpass .red-left'));
			},
			rules: {
				password: {
					required: true,
					minlength: 8
				},
				confirm_pass: {				
					required: true,				
					minlength: 8,				
					equalTo: "#mdp"
				}
			},
			messages: {
				password: {
					required: signup.password.required,//"- Un mot de passe est requis.",
					minlength: signup.password.minlength//"- Le mot de passe doit contenir au minimum n charactères."
				},
				confirm_pass: {
					required: signup.confirm_pass.required,//"- Confirmer votre mot de passe.",
					equalTo: signup.confirm_pass.equalTo//"- Saisisser de nouveau le mot de passe.",
				}
			},
			submitHandler: function(form) {
				var myDate = new Date();
				var offset = myDate.getTimezoneOffset();
				jQuery(form).ajaxSubmit({
					dataType:  'json', 
					success:   resetpass,
					data : {date:offset}
				});
			}
		});
});


function sendpass(data)
{
	// submit the form
	if (data.success) 
	{
		$('#summarypass').hide();
		$('#sendpass-success').show('slow');
	}
	else 
	{
		$('#summarypass .red-left').html(data.message);$('#summarypass').show();
	}
    // return false to prevent normal browser submit and page navigation 
    return false; 
}


function resetpass(data)
{
	// submit the form
	if (data.success) 
	{
		$('#summaryresetpass').hide();
		$('#resetpass-success').show('slow');
	}
	else 
	{
		$('#summaryresetpass .red-left').html(data.message);$('#summaryresetpass').show();
	}
    // return false to prevent normal browser submit and page navigation 
    return false; 
}
