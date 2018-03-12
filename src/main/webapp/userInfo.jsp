<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<script src = "js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function getSex(){
		var sex = $("#hidsex").val();
		var sex1 = $("#man").val();
		var sex2 = $("#woman").val();
		
		if(sex == sex1){
			/* $("#man").attr('checked',true); */
			$("#man").prop('checked',true);
		}
		if(sex == sex2){
			/* $("#woman").attr('checked',true); */
			$("#woman").prop('checked',true);
		}
	}
</script>
<script type="text/javascript">
	$(function(){
		
		$.getJSON("<%=request.getContextPath()%>/selectAll",function(data){
			
			$("#id").attr("value",data.id);
			$("#username").attr("value",data.username);
			$("#password").attr("value",data.password);
			$("#hidsex").attr("value",data.sex);
			$("#age").attr("value",data.age);
			
			getSex();
			
		});
		
		$("#btn").click(function(){
			
			var id = $("#id").val();
			
			var username = $("#username").val();
			var password = $("#password").val();
			/* if($("#sex1").attr('checked',true)){
				var sex = "男";
			}else if($("#sex").attr('checked',true)){
				var sex = "女";
			}else{
				var sex = "";
			} */
			var sex = $('input:radio[name="sex"]:checked').val();
			/* var birthday = $("#birthday").val(); */
			var age = $("#age").val();
			var args = {"id":id,
						"username":username,
						"password":password,
						"sex":sex,
						/* "birthday":birthday, */
						"age":age};
			var url = "<%=request.getContextPath()%>/user";
			$.getJSON(url,args,function(data){
				alert(data);
				
				if(data.flag == 1){
				
					alert("修改成功");
				
				}else{
					
					alert("修改失败");
				}
			});
		});
	})
	
</script>
</head>
<body>

	欢迎你：<%=session.getAttribute("username") %>用户<br /><br /><br />
	
	<input type = "hidden" id = "id" name = "id" />
	用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type = "text" id = "username" name = "username" /><br />
	密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type = "password" id = "password" name = "password" /><br />
	<input type = "hidden" id = "hidsex" />
	性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type = "radio" id = "man" name = "sex" value = "男" />男
		<input type = "radio" id = "woman" name = "sex" value = "女"/>女<br />
	年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<input type = "text" name = "age" id = "age" /><br />
	<input type = "submit" id = "btn" value = "修改" />
	
</body>
</html>