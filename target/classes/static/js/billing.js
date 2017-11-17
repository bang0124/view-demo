
$(document).ready(function(){
	$("button[class='clsbtn medi navy w20']").click(function(){
			
			var fName = $('input[name="firstname"]').val();
			var lName = $('input[name="lastname"]').val();
			var company = $('input[name="company"]').val();
			var address = $('input[name="address"]').val();
			var address2 = $('input[name="address2"]').val();
			var country = $('input[name="country"]').val();
			var city = $('input[name="city"]').val();
			var creditNumber = $('input[name="number"]').val();
			var securityCode = $('input[name="code"]').val();
			var exDate1 = $('#exDate1').val();
			var exDate2 = $('#exDate2').val();
			var card = $('input[name="card"]').val();
			
			if(fName == "") {
				alert("please type your FirstName");
				$('input[name="firstname"]').focus();
				$('input[name="firstname"]').select();
			} else if(lName == "") {
				alert("please type your LastName");
				$('input[name="lastname"]').focus();
				$('input[name="lastname"]').select();
			} else if(company == "") {
				alert("please type phone number");
				$('input[name="company"]').focus();
				$('input[name="company"]').select();
			} else if(address == "") {
				alert("please type Address");
				$('input[name="address"]').focus();
				$('input[name="address"]').select();
			}else if(address2 == "") {
				alert("please type Address(continue)");
				$('input[name="address2"]').focus();
				$('input[name="address2"]').select();
			} else if(country == "") {
				alert("please type country");
				$('input[name="country"]').focus();
				$('input[name="country"]').select();
			} else if(city == "") {
				alert("please type city");
				$('input[name="city"]').focus();
				$('#clsPassword').select();
			} else if(creditNumber == "") {
				alert("please type Credit card number ");
				$('input[name="number"]').focus();
				$('input[name="number"]').select();
			} else if(securityCode == "") {
				alert("please type Security code");
				$('input[name="code"]').focus();
				$('input[name="code"]').select();
			} else if(exDate1 == "") {
				alert("please type Expiration date");
				$('#exDate1').focus();
				$('#exDate1').select();
			} else if(exDate2 == "") {
				alert("please type Expiration date");
				$('#exDate2').focus();
				$('#exDate2').select();
			} else if(card == "") {
				alert("please type Name on card");
				$('input[name="card"]').focus();
				$('input[name="card"]').select();
			} else {
				
				$.ajax({
					type:"POST",
					url:"/billingConfirm",
					data: {
						
							address : address,
							 address2 : address2,
							 country : country,
							 city : city,
							 creditNumber : creditNumber,
							 securityCode : securityCode,
							 exDate1 : exDate1,
							 exDate2 : exDate2,
							 card : card
						 },
					success:function(result, request) {
						var res = eval("("+result+")");
						if(res.success == "true") {
							alert("success");
							location.href="/pricing";
						} else {
							
						}
					}
					
				});
				
			}

	});

});



function formValidation () {
	return true;
}

function btnClick () {
	$("button[class='clsbtn medi navy w20']").click();
}