<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
<script src = "js/jquery-1.12.4.min.js"></script>
<script src = "js/ajaxfileupload.js"></script>
<script type="text/javascript">

function addWord(){
	
	var url = "<%=request.getContextPath()%>/addWord";
	var id = $("#id").val();
	var name = $("#name").val();
	var descp = $("#descp").val();
	/* var picName = $("#picName").val(); */
	var args = {id:id,name:name,descp:descp};
	$.getJSON(url,args,function(data){
		
		if(data.flag == "0"){
			
			alert("添加失败");
		}else if (data.flag == "1"){
			
			alert("添加成功");
		}
		
	});
}

function sub() {
	
	var uploadUrl ="<%=request.getContextPath()%>/upload";
	$.ajaxFileUpload({
 		url:uploadUrl,
 		type:'post',
 		secureuri:false,     			//是否启用安全提交,默认为false
 		fileElementId:'file',           //文件选择框的id属性
		dataType:'text/html',            	//服务器返回的格式,可以是json或xml等
		enctype:'multipart/form-data',	//注意一定要有该参数  
		success:function(data, status){        //服务器响应成功时的处理函数
			/* $("#picName").val(eval("("+data+")").picName);
		addWord(); */
		   console.log('su',data);
		   $("#picName").val(eval("("+data+")").picName);
		   /* addWord(); */
		
		},
		error:function(data, status, e){ //服务器响应失败时的处理函数
			console.log('er',data);
		}
 	}) 
}
	
</script>
</head>
<body>
	<!-- enctype = "multipart/form-data"  是上传二进制数据，故request得不到值 -->
	
	<div>
		编号<input type = "text" id = "id" name = "id" />
	</div>
	<div>
		姓名<input type = "text" id = "name" name = "name" />
	</div>
	<div>
		描述<input type = "text" id = "descp" name = "descp" />
	</div>
	<div>
		<input type="file" name="file" id="file"/>
		<input type="hidden" name="picName" id="picName">
		<input type="hidden" name="idText" id="idText">
		<input type = "button" onclick = "addWord()" value = "提交" />
	</div>
	
	
	
</body>
</html>