
$(document).ready(function(){
	$("button[class='crbtn medi navy']").click(function(){
			
			var hostName = $('#siteName').val();
			var userId = $('#clsEmail').val();
			var fName = $('#fName').val();
			var lName = $('#lName').val();
			var userPwd = $('#clsPassword').val();
			var country = $('input[class="select-button"]').val();
			var phoneNo = $('#phoneNo').val();
			var company = $('#clsCompany').val();
			var userPwdConfirm = $('#clsPassword_confirm').val();
			
			//이메일 형식 , 휴대번호 형식, 비밀번호 형식 정규식
			var emailValidation = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var phoneNoValidation = /^[0-9]+$/;
			var passwordValidation = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
			if(company == "") {
				alert("please type your company name");
				$('#clsCompany').focus();
				$('#clsCompany').select();
			} else if(!emailValidation.test(userId)) {
				alert("please type correct Email Form");
				$('#clsEmail').focus();
				$('#clsEmail').select();
			} else if(phoneNo == "") {
				alert("please type phone number");
				$('#phoneNo').focus();
				$('#phoneNo').select();
			} else if(!phoneNoValidation.test(phoneNo)) {
				alert("please type correct phone number");
				$('#phoneNo').focus();
				$('#phoneNo').select();
			}else if(fName == "") {
				alert("please type first Name");
				$('#fName').focus();
				$('#fName').select();
			} else if(lName == "") {
				alert("please type last Name");
				$('#lName').focus();
				$('#lName').select();
			} else if(userPwd == "") {
				alert("please type password");
				$('#clsPassword').focus();
				$('#clsPassword').select();
			} else if(userPwd != userPwdConfirm) {
				alert("Both password is not matched");
				$('#clsPassword').focus();
				$('#clsPassword').select();
			} else if(!passwordValidation.test(userPwdConfirm) ) {
				showRedAlert();
				$('#clsPassword').focus();
				$('#clsPassword').select();
			}else {
				
				$('.cls_crPopWrap').removeAttr('style');
				
//				$.ajax({
//					type:"GET",
//					url:"/rest/hostNameValidation",
//					data:{
//						hostName:hostName
//					},
//					success:function(result, request) {
//						 var res = eval("("+result+")");
//						 if(res.success == "true") {
							 $.ajax({
								 type:"GET",
								  url: "/rest/userIdValidation",
								  data:{
									userId:userId  
								  },
								  success:function(result, request) {
									  var res = eval("("+result+")");
									  if(res.success == "true") {
										  $.ajax({
											  type:"POST",
											  url:"/rest/registUserInfo",
											  data: {
														userId:userId,
														fName:fName,
														lName:lName,
														userPwd:userPwd,
														phoneNo:phoneNo,
														company:company
														
													  },
												success:function(result, request) {
													var res = eval("("+result+")");
													if(res.success == "true") {
														alert("success");
														location.href="/login";
													} else {
														
													} //ajax3 success if else
												}  //ajax3 success
										  }); //ajax 3
									  } else {
										  alert("email is already exist");
										  $('.cls_crPopWrap').attr('style', 'display:none');
										  $('#clsEmail').focus();
										  $('#clsEmail').select();
									  }// ajax2 success if else
								  }// ajax 2 success
							 }); // ajax 2
							 
//						 } else{
//						  alert("site url is already exist");
//						  $('.cls_crPopWrap').attr('style', 'display:none');
//						  $('#siteName').focus();
//						  $('#siteName').select();
//						 }//ajax1 success if else
//						 
//					} // ajax1 success
//				}); // ajax 1
			} 
			

	});

	$("span[class='close']").click(function(){
		$("#redAlerBox").attr("style", "display:none");
	});
});



function formValidation () {
	return true;
}

function btnClick () {
	$("button[class='crbtn medi navy']").click();
}

function showRedAlert() {
	$("#redAlerBox").removeAttr("style");
}

function hideRedAlert() {
	
}