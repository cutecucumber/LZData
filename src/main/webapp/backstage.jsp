<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>网络安全辅助教学平台</title>
  <link rel="stylesheet" href="js/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">教师管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          <%=session.getAttribute("username") %> 用户
        </a>
        <!-- <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl> -->
      </li>
      <li class="layui-nav-item"><a href="login.jsp">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a href="javascript:;">所有商品</a></li>
        <li class="layui-nav-item"><a href="javascript:;">解决方案</a></li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item" id = "www"><a href="">个人信息</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;margin-left: 120px;margin-top: 70px;font-size: 15px" id = "sss">
    	欢迎你：<%=session.getAttribute("username") %>用户<br /><br /><br />
	
		<input type = "hidden" id = "id" name = "id" value = <%=session.getAttribute("id") %> />
		用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type = "text" id = "username" name = "username" value = <%=session.getAttribute("username") %> /><br /><br />
		密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type = "password" id = "password" name = "password" value = <%=session.getAttribute("password") %> /><br /><br />
		<input type = "hidden" id = "hidsex" />
		性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type = "radio" id = "man" name = "sex" value = "男" />男
		<input type = "radio" id = "woman" name = "sex" value = "女"/>女<br /><br />
		年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<input type = "text" name = "age" id = "age" value = <%=session.getAttribute("age") %> /><br /><br />
		<button id = "btn">保存</button>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    	欢迎登录网络安全教学平台系统
  </div>
</div>
<script src="js/layui/layui.js"></script>
<script src = "js/jquery-1.12.4.min.js"></script>
<script src = "js/jquery.min.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
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
$("#www").click(function(){
	$("#sss").hide();
});
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
		var sex = $('input:radio[name="sex"]:checked').val();
		var age = $("#age").val();
		var args = {"id":id,
					"username":username,
					"password":password,
					"sex":sex,
					"age":age};
		var url = "<%=request.getContextPath()%>/user";
		$.getJSON(url,args,function(data){
			if(data.flag == 1){
				alert("修改成功");
			}else{
				alert("修改失败");
			}
		});
	});
})
</script>
</body>
</html>