<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Cube login</title>
<link href="/css/reset.css" rel="stylesheet" type="text/css">
<link href="/css/cls_style.css" rel="stylesheet" type="text/css">
<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/jquery.selectlist.js" type="text/javascript"></script>
</head>

<body>
 <div id="clsWrapper">
    <div class="cls_CreateTop">
    </div><!---/cls_CreateTop-->
    <div class="cls_CreateWrap">
    	<h1><a href="/"><img src="/images/cls_style/cls_start_logo.png" alt="cube login"></a></h1>
        <div class="cls_crConts">
            <div class="cls_crImg2"><img src="/images/cls_style/cls_start_img.png" alt="cube login image"></div>
            <!---cls_CreateForm-->
            <div class="cls_crForm">
              <form>
                  <fieldset>
                      <legend>cube login</legend>
                      <h1>데모를 시현 합니다.</h1>
                  </fieldset>
              </form>
            </div><!---/cls_CreateForm-->
            
        </div><!---/cls_CreateConts-->
    </div><!---/cls_CreateWrap-->
 </div><!---/clsWrapper-->
 <!---cls_crPopWrap-->
 <div class="cls_crPopWrap" style="display:none;">
 	<div class="cls_crPop">
    	<p>Check your email address!</p>
        <span class="crEmail"><img src="/images/cls_style/cls_cr_email.png" alt="email"></span>
        <span class="crLoad"><img src="/images/cls_style/email_load.gif" alt="loading"></span>
    </div>
 </div><!---/cls_crPopWrap-->
 <script>
 	$(function(){
		$('select').selectlist({
			zIndex: 100,
			width: '100%',
			height: 34
		});		
	})
	
window.onload = function(){ 
    var obj = document.getElementById("userId"); 
    obj.focus(); obj.select(); 
}
	
function post(URL, PARAMS) {
	var temp = document.createElement('form');
	temp.action = URL;
	temp.method = 'POST';
	temp.style.display = 'none';
	for (var x in PARAMS) {
		var opt = document.createElement('textarea');
		opt.name = x;
		opt.value = PARAMS[x];
		temp.appendChild(opt);
	}
	document.body.appendChild(temp);
	temp.submit();
	return temp;
};
	
function authentication() {
		
		var userId = $("#userId").val();
		var userPwd = $("#password").val();
		var obj = new Object();
		obj.userId = userId;
		obj.userPwd = userPwd;
		var jsonData = JSON.stringify(obj);
		  
		
		if(userId == "") {
			alert("please type your ID");
		} else if(userPwd == "") {
			alert("please type your Password");
		} else {

			/* post('/j_spring_security_check.do',
				{
					j_username : userId, 
					j_password : userPwd
				}
			); */
			
			$.ajax({
				url:"/login/request",
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
					userId:userId,
					userPwd:userPwd
				}
			});
			
		}
	}
	
function btnClick () {
	$("button[class='crbtn medi navy']").click();
} 
 </script>
</body>
</html>
