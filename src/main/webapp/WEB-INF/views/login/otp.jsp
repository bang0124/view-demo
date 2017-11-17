<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>2FA Authentication : Cube login</title>
<link href="/css/reset.css" rel="stylesheet" type="text/css">
<link href="/css/cls_style.css" rel="stylesheet" type="text/css">
<script src="/js/jquery.min.js" type="text/javascript"></script>
</head>

<body>
<div id="clsWrapper">
    <div class="cls_CreateTop">
    </div><!---/cls_CreateTop-->
    <div class="cls_CreateWrap">
    	<h1><a href="/"><img src="/images/cls_style/cls_start_logo.png" alt="cube login"></a></h1>
    	
        <div class="cls_crConts">
            <div class="cls_crImg2"><a href="/"><img src="/images/cls_style/cls_start_img.png" alt="cube login image"></a></div>
            <!---cls_CreateForm-->
            <div class="cls_crForm">
              <h2>2FA Authentication</h2>
              <!-- alert msg -->
              <div class="alert box-yellow mt10" style="display:none;" id="alertYelloDiv">
                  <p>OTP(One Time Password) is sent to your registered phone number.</p>
                  <span class="close" title="close"></span>
              </div>
              <div class="alert box-red mt10 hide" style="display:none;" id="alertRedDiv">
                  <p>OTP is invaild. Please check again.</p>
                  <span class="close"></span>
              </div><!--//alert msg -->
              <div class="cls_idArea">
                  <span class="id-img"></span>
                  <span class="id"><c:out value="${sessionScope.userId }"/></span>
              </div>
              <form>
                <fieldset>
                <legend>2FA Authentication</legend>
                  <div class="option">
                    <ul class="half"> <!--four로 바꾸면 4개 사용 가능  -->
                      <li>
                         <button type="button" class="opt-sms">
                           <span class="name">SMS</span>
                         </button >
                      </li>
                      <li>
                          <button type="button" class="opt-email">
                            <span class="name">E-Mail</span>
                          </button>
                      </li>
                    </ul>
                  </div>
                  <ul>
                    <li>
                        <label class="invisible">OTP</label>
                        <input type="text" value="" placeholder="Enter your OTP" id="otpDiv" style="background:#f8f8f8; display:none;" onkeypress="if(event.keyCode==13) {btnClick(); return false;}">
                    </li>
                  </ul>
                  <div class="crbtnArea"><button type="button" class="crbtn medi navy">Login</button></div>
                  </fieldset>
              </form>
              <div class="clsInfo_links"><a href="/login">Sign in with a different account.</a></div>
            </div><!---/cls_CreateForm-->
        </div><!---/cls_CreateConts-->
    </div><!---/cls_CreateWrap-->
 </div><!---/clsWrapper-->
</body>
<script>
var emailClick = false;
var smsClick = false;
var motpClick = false;
var pushClick = false;
	
$(document).ready(function() {
	
	 $(".opt-sms").click(function() {
			
		 showYelloAlert();
		 show();
		 boxFocus();
		if(smsClick == true) {
			alert("already clicked!");
			return false;
		} else {
			//showAlert();
			$.ajax({
				url:"/otp/request",
				type:"POST",
				success: function(result, request) {
					var res = eval("("+result+")");
					if(res.success == "true") {
						
					} else {
						alert("OTP isuue fail");
					}
				},
				failure: function(result, request) {
					
				}, data:{
					otpType:"sms"
				}
			});
		}
		smsClick = true;
		motpClick = false;
		emailClick = false; 
		pushClick = false;
		
	}); 
	 
	 $("button[class='crbtn medi navy']").click(function(){
			
			$.ajax({
				url:"/otp/validation",
				type:"POST",
				data:{
					otpType:"sms",
					otp : $("#otpDiv").val()
				},
				success: function(result, request) {
					var res = eval("("+result+")");
					if(res.success == "true") {
						/* location.href = "/account/detail"; */
						$.ajax({
							url:"/rest/check",
							type:"GET",
							success: function(result, request) {
								var res = eval("("+result+")");
								if(res.success == "true") { // 구매한사용자
									location.href = "/account/detail";
								} else if(res.success == "false") { //가입만한 사용자
									location.href = "/regist/billing";
								} //ajax2 if else
							}
						});//ajax2
						
						
					} else { //ajax1 if else
						hideYelloAlert();
						showRedAlert();
					}
				},
				failure: function(result, request) {
					
				}
			});//ajax1
		  });
	
	$(".opt-otp").click(function() {
		
			/* motpCss(); */
			showYelloAlert();
			show();
			boxFocus();
			
			if(motpClick == true) {
				alert("already clicked!");
				return false;
			} 
			motpClick = true;
			emailClick = false; 
			smsClick = false;
			pushClick = false;
			
	});
	
	 $(".opt-email").click(function() {
			
		 	/* emailCss(); */
			showYelloAlert();
		 	show();
			boxFocus();
			
			if(emailClick == true) {
				alert("already clicked!");
				return false;
			} 
			emailClick = true; 
			motpClick = false;
			smsClick = false;
			pushClick = false;
			
	});
	 
	$(".opt-push").click(function() {
		 
		hide();
		
		if(pushClick == true) {
			alert("already clicked!");
			return false;
		} 
		pushClick = true;
		emailClick = false; 
		motpClick = false;
		smsClick = false;
	 });
	
	$("#alertYelloDiv").children(".close").click(function() {
		$("#alertYelloDiv").attr("style", "display:none");
	});
	
	$("#alertRedDiv").children(".close").click(function() {
		$("#alertRedDiv").attr("style", "display:none");
	});
	alertRedDiv
	
});
	function show() {
		$("#otpDiv").css("display","");
	}
	
	function hide() {
		$("#otpDiv").css("display","none");
	}
	
	function boxFocus(){ 
	    var obj = document.getElementById("otpDiv"); 
	    obj.focus(); obj.select(); 
	}
	
	function showYelloAlert() {
		$("#alertYelloDiv").css("display","");
	}
	
	function hideYelloAlert() {
		$("#alertYelloDiv").css("display","none");
	}
	
	function showRedAlert() {
		$("#alertRedDiv").css("display","");
	}
	
	function hideRedAlert() {
		$("#alertRedDiv").css("display","none");
	}
	
	function btnClick () {
		$("button[class='crbtn medi navy']").click();
	} 
</script>
</html>
