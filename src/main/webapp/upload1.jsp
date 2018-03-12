<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "js/jquery-1.12.4.min.js"></script>
<script src = "js/ajaxfileupload.js"></script>
<script type="text/javascript">
	function touch(){
		
		var uploadUrl ="<%=request.getContextPath()%>/upload";
			$.ajaxFileUpload({
	 		url:uploadUrl,
	 		secureuri:false,     			//是否启用安全提交,默认为false
	 		fileElementId:'file',           //文件选择框的id属性
			dataType:'text/html',            	//服务器返回的格式,可以是json或xml等
			enctype:'multipart/form-data',	//注意一定要有该参数  
			success:function(data, status){        //服务器响应成功时的处理函数
				$("#picName").val(eval("("+data+")").picName);
			},
			error:function(data, status, e){ //服务器响应失败时的处理函数
				alert("Error!")
			}
		 }) 
		
	}
</script>
</head>
<body>
	<input type = "file" name = "file" />
	<input type = "hidden" name = "picName" id = "picName">
	<button type = "submit" onclick = "touch()">提交</button>
</body>
</html>