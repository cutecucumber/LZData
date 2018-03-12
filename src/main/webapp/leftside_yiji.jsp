<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String fg = request.getParameter("fg");
	if(fg==null || "".equals(fg)){
		fg="jxsgl";
	} 
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>控制台_左导航</title>
	<link rel="stylesheet" href="css/leftside_yiji.css">
	<!--<script src="js/bootstrap.min.js"></script>-->
	<script src="js/jquery-1.12.4.min.js"></script>
	<!--导航提示框-->
	<!--<script src="js/bootstrap.min.js"></script>-->
	<!--<script>
  	$(function () { $("[data-toggle='tooltip']").tooltip(); });
	</script>-->
	
	<script type="text/javascript">
		$(function(){
			var fg = "<%=fg %>";
			$("#"+fg).attr("class","active");
			
			//根据登录的帐号ID，判断菜单权限
			getMenuByAccId();
			
		});
		
		//根据登录的帐号ID，判断菜单权限
		function getMenuByAccId(){
			var url= "<%=request.getContextPath()%>/menu/getMenuByAccId";
			//无参数，后台从session中登录账户ID
			var args = "";
			
			$.post(url,args,function(data){
				if(data != ""){
					//不包含客户管理					
					if(data.indexOf("经销商管理")<0){
					 	$("#jxsgl").hide();
					}
					//不包含车辆管理
					if(data.indexOf("车载终端管理")<0){
					 	$("#zdgl").hide();
					}
					//不包含统计报表
					if(data.indexOf("后台管理")<0){
					 	$("#htgl").hide();
					}
					//不包含用户管理
					if(data.indexOf("用户管理")<0){
					 	$("#yhgl").hide();
					}
					//不包含个人信息
					if(data.indexOf("个人信息")<0){
					 	$("#grxx").hide();
					}
										
				}
    	 	}); 	
			
		}
		
	
	</script>
</head>
<body>	
<div class="leftside_wrap">
		<!--点击按钮 -->
		<div id="navbtn" class="navbtn" onclick="isShowSide()">
			<div class="navbtn_img"></div>
	  	</div>
		<ul class="leftnav_first">
			<li id="jxsgl">
				<a href="<%=request.getContextPath() %>/user/getDealerAndAccount" target="main" title="经销商管理">
					<img src="img/nav01.png"><span >经销商管理</span>
				</a>
			</li>
			<li id="zdgl">
				<a href="../terminal/terminal_erji_index.jsp" target="main" title="车载终端管理">
					<img src="img/nav02.png"><span>车载终端管理</span>
				</a>
			</li>
			<li id="htgl">
				<a href="model_erji_index.jsp" target="main" title="后台管理">
					<img src="img/nav03.png"><span>后台管理</span>
				</a>		
			</li>
			<li id="yhgl">
				<a href="user_erji_index.jsp" target="main" title="用户管理">
					<img src="img/nav04.png"><span>用户管理</span>
				</a>
			</li>
			<li id="grxx">
				<a href="user_erji_info.jsp" target="main" title="个人信息">
					<img src="img/nav04.png"><span>个人信息</span>
				</a>
			</li>
		</ul>
	</div>

<script>
/*点击汉堡包按钮显示  隐藏侧栏文字*/
function isShowSide() {
	if (window.parent.console_wrap.cols == "150,*") {
		window.parent.console_wrap.cols = "50,*";
		$(".leftnav_first li a span").hide();
		$(".leftside_wrap").addClass("leftside_wrap1");
	} else {
		window.parent.console_wrap.cols = "150,*";
		$(".leftnav_first li a span").show();
		$(".leftside_wrap").removeClass("leftside_wrap1");
	}
}
/*选中的侧栏导航颜色改变*/
$(".leftnav_first li").click(function(){
	$(this).siblings("li").removeClass("active");
	$(this).addClass("active");

});
</script>
</body>
</html>