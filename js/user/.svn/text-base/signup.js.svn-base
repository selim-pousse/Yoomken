

$(document).ready(function() { 
	$( "#signup_address" ).textboxlist({title:'',max:1,onlyStrictValues:true,unique: true, plugins: {autocomplete: {
		queryRemote: true,
		source: codeAddress,
		onlyFromValues :true
	}}});
	
	$("#signup_form").validate({
		errorElement: "em",
		errorContainer: $("#warning, #summary2"),
		errorPlacement: function(error, element) {
			error.appendTo( $('#summary2 .red-left'));
		},
		rules: {
			fullname: {
				required: true,
				minlength: 5,
				differentTo:'* '+label.fname + "..."
			},
        	pseudo: {
				required: true,
				minlength: 2,
				remote:'/ajax/availablePseudo',
				pseudoRegex: true
			},
			profil: {
				required: true,
			},
			password: {
					required: true,
					minlength: 8
			},
			confirm_pass: {				
				required: true,				
				minlength: 8,				
				equalTo: "#mdp"
			},
			clone_mdp: {
				differentTo:'* '+label.mdp +"..."
			},
			clone_mdp2: {					
				differentTo:'* '+label.mdp2 +"..."
			},
			email: {
				required: true,
				email: true,
				remote:'/ajax/availableEmail'
			},
			location: {
                required: true
           },
           policy: {
                required: true
            }
		},
		messages: {
			fullname: {
				required: signup.fullname.required,//."- Le nom complet est requis.",
				minlength: signup.fullname.minlength,//"- Le nom complet doit contenir au minimum n charactères.",
				differentTo : signup.fullname.required//"- Le nom complet est requis."
			},
			clone_mdp :"",
			clone_mdp2 :"",
			profil : "- " + label.profil,
			password: {
				required: signup.password.required,//"- Un mot de passe est requis.",
				minlength: signup.password.minlength//"- Le mot de passe doit contenir au minimum n charactères."
			},
			confirm_pass: {
				required: signup.confirm_pass.required,//"- Confirmer votre mot de passe.",
				equalTo: signup.confirm_pass.equalTo//"- Saisisser de nouveau le mot de passe.",
			},
			email: {
				required: signup.email.required,//"- l'email est requis'.",
				email: signup.email.email,//"- Saisisser un email valide.",
				remote: signup.email.remote//"- L'email est déjà enregistré."
			},
			location: signup.location.required,//"- Précisser votre adresse.",
			policy: signup.policy.required,//"- Accepter les conditions d'utilisation.",
			pseudo: {
				minlength: signup.pseudo.minlength,//"- Le pseudonyme doit contenir au minimum n charactères.",
				required: signup.pseudo.required,//"- Saisisser un nom d'utilisateur unique.",
				remote: signup.pseudo.remote,//"- Le nom d'utilisateur est déjà enregistré.",
				pseudoRegex: signup.pseudo.pseudoRegex//"- Le nom d'utilisateur est non valide, seul les caractères alphanumériques sont acceptés."
			}
		},
		submitHandler: function(form) {
			
			//if ($(form).attr('jump')=='true') form.submit();
			//else {
				jQuery(form).ajaxSubmit({
					dataType:  'json', 
					success:   register
				});
			//}
		}
	});
	
	if($('#summary2 .red-left').text()!='') $('#summary2').delay(1000).fadeIn('slow');
	inFieldLabel();
	
});

function register(response)
{
	loader.hide();
	if (response.success){
		$('#register-success').show('slow',function(){});
		document.location.href ='/';
	}
	else {
		$('#summary2 .red-left').html(response.error);
	}
}