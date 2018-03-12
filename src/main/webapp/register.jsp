<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生注册</title>
<script src = "js/jquery-1.12.4.min.js"></script>
<script src = "js/jquery.min.js"></script>
<script type="text/javascript">

	function userInput(){
		
		var login = $("#username").val();
		
		var url = "<%=request.getContextPath()%>/confirm";
		
		var args = {login:login};
		
		$.getJSON(url,args,function(data){
			
			if(data.flag == "1"){
				
				$("#span1").html("该用户名已存在");
				
				$("#username").focus();
				
			}else{
				$("#span1").html("");
			}
			
		});
	};
	$(function(){
		
		$("#btn").click(function(){
			
			var type = $("#type").val();
			var username = $("#username").val().trim();
			var psw = $("#password").val().trim();
			var psw1 = $("#password1").val().trim();
			
			if(username == ""){
				alert("请输入用户名");
				$("#username").focus();
				return true;
			}
			if(psw == ""){
				alert("请输入密码");
				$("#password").focus();
				return true;
			}
			if(psw1 == ""){
				alert("请再次输入密码");
				return true;
			}
			if(psw != psw1){
				alert("两次密码不一样，请重新输入");
				return true;
			}
			var url = "<%=request.getContextPath()%>/register";
			var args = {username:username,password:psw,type:type};
			$.getJSON(url,args,function(data){
				
				if(data.flag == 1){
					alert("注册成功");
					location.href = "login.jsp";
				}else if(data.flag == -1){
					alert("用户名已存在");
					$("#username").focus();
					$("#password").val("");
					$("#password1").val("");
				}else{
					alert("注册失败");
					$("#username").focus();
					$("#password").val("");
					$("#password1").val("");
				}
			});
		});
		
	});
</script>
</head>
<body>
	<input type = "hidden" id = "type" name = "type" value = "user" />
	用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type = "text" name = "username" id = "username" onblur = "userInput()" /><span id = "span1"></span><br />
	密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type = "password" id = "password" name = "password" /><br />
	确认密码：<input type = "password" id = "password1" name = "password1" /><br />
	<button type = "submit" id = "btn">注册</button>
</body>
</html>