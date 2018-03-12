<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0"> 
	<title>注册界面</title>
    <link href="js/css/default.css" rel="stylesheet" type="text/css" />
	<!--必要样式-->
    <link href="js/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="js/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="js/css/loaders.css" rel="stylesheet" type="text/css" />
    
    <style>
	    .login_fields__submit a{
	    	margin-left: 70px;
	    	text-decoration: none;
	    	font-size: 13px;
	    	color: #D3D7F7;
	    }
		.login_fields__submit a:hover{
			color:red;
		}
	</style>
	
</head>
<body>
	<div class='login'>
	  <!-- <div class='login_title'>
	    <span>注册</span>
	  </div> -->
	  <p style = "font-size: 16px;margin-top: -30px;margin-bottom: 40px;text-align: center">欢迎进入注册界面</p>
	  <div class='login_fields'>
	  <input type = "hidden" id = "type" name = "type" value = "user" />
	    <div class='login_fields__user'>
	      <div class='icon'>
	        <img alt="" src='js/img/user_icon_copy.png'>
	      </div>
	      <input id = "login" name="login" placeholder='用户名' maxlength="16" type='text' autocomplete="off" onblur = "userInput()" /><span id = "span1"></span>
	        <div class='validation'>
	          <img alt="" src='js/img/tick.png'>
	        </div>
	    </div>
	    <!-- 第一次输入密码 -->
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='js/img/lock_icon_copy.png'>
	      </div>
	      <input id = "pwd" name="pwd" placeholder='密码' maxlength="16" type='text' autocomplete="off">
	      <div class='validation'>
	        <img alt="" src='js/img/tick.png'>
	      </div>
	    </div>
	    <!-- 重新输入密码 -->
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='js/img/lock_icon_copy.png'>
	      </div>
	      <input id = "pwd1" name="pwd1" placeholder='确认密码' maxlength="16" type='text' autocomplete="off" onblur = "pwdInput()">
	      <div class='validation'>
	        <img alt="" src='js/img/tick.png'>
	      </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='js/img/key.png'>
	      </div>
	      <input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off" />
	      <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
          <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
	      </div>
	    </div>
	    <div class='login_fields__submit'>
	      <p><input type='button' value='立即注册' style = "margin-left: 53px;margin-top: 10px;margin-bottom: 30px"></p>
	      <a href = "login.jsp" >有账号！直接去登录</a>
	      
	    </div>
	  </div>
	  <div class='success'>
	  </div>
	  <!-- <div class='disclaimer'>
	    <p>欢迎登录后台管理系统  更多网站模板：<a href="http://www.sucaihuo.com/" target="_blank">素材火</a></p>
	  </div> -->
	</div>
	<div class='authent'>
	  <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
        </div>
	  <p>认证中...</p>
	</div>
	<div class="OverWindows"></div>
	
    <link href="js/layui/css/layui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src='js/js/stopExecutionOnTimeout.js?t=1'></script>
    <script type="text/javascript" src="js/layui/layui.js"></script>
    <script type="text/javascript" src="js/js/Particleground.js"></script>
    <script type="text/javascript" src="js/js/Treatment.js"></script>
    <script type="text/javascript" src="js/js/jquery.mockjax.js"></script>
	<script type="text/javascript">
		var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
		var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
		
		var CodeVal = 0;
	    Code();
	    function Code() {
			if(canGetCookie == 1){
				createCode("AdminCode");
				var AdminCode = getCookieValue("AdminCode");
				showCheck(AdminCode);
			}else{
				showCheck(createCode(""));
			}
	    }
	    function showCheck(a) {
			CodeVal = a;
	        var c = document.getElementById("myCanvas");
	        var ctx = c.getContext("2d");
	        ctx.clearRect(0, 0, 1000, 1000);
	        ctx.font = "80px 'Hiragino Sans GB'";
	        ctx.fillStyle = "#E8DFE8";
	        ctx.fillText(a, 0, 100);
	    }
	    $(document).keypress(function (e) {
	        // 回车键事件  
	        if (e.which == 13) {
	            $('input[type="button"]').click();
	        }
	    });
	    //粒子背景特效
	    $('body').particleground({
	        dotColor: '#E8DFE8',
	        lineColor: '#133b88'
	    });
	    $('input[name="pwd"]').focus(function () {
	        $(this).attr('type', 'password');
	    });
	    $('input[name="pwd1"]').focus(function () {
	        $(this).attr('type', 'password');
	    });
	    $('input[type="text"]').focus(function () {
	        $(this).prev().animate({ 'opacity': '1' }, 200);
	    });
	    $('input[type="text"],input[type="password"]').blur(function () {
	        $(this).prev().animate({ 'opacity': '.5' }, 200);
	    });
	    $('input[name="login"],input[name="pwd"]').keyup(function () {
	        var Len = $(this).val().length;
	        if (!$(this).val() == '' && Len >= 5) {
	            $(this).next().animate({
	                'opacity': '1',
	                'right': '30'
	            }, 200);
	        } else {
	            $(this).next().animate({
	                'opacity': '0',
	                'right': '20'
	            }, 200);
	        }
	    });
        
	    var open = 0;
	    layui.use('layer', function () {
	    	
	    	//判断密码是否相同
		    /* function pwdInput(){
		    	alert(222);
		    	alert(pwd);
		    	alert(pwd1);
				if(pwd1 != pwd){
					ErroAlert("两次密码不一样，请重新输入");
				}
				
			} */
	        //非空验证
			$('#pwd1').on('blur',function(){
	        	var abc=$(this).val();
	        	var ab = $('#pwd').val();
	        	if(ab != abc){
	        		ErroAlert("两次密码不一样，请重新输入");
	        		return ;
	        	}
	        });
	        $('input[type="button"]').click(function () {
	            var login = $('input[name="login"]').val().trim();
	            var pwd = $('input[name="pwd"]').val().trim();
	            var pwd1 = $('input[name="pwd1"]').val().trim();
	            var code = $('input[name="code"]').val();
	            var type = $("#type").val();
	            if (login == '') {
	                ErroAlert('请输入您的账号');
	                $("#login").focus();
	            } else if (pwd == '') {
	                ErroAlert('请输入密码');
	                $("#pwd").focus();
	            }else if (pwd1 == '') {
	                ErroAlert('请再次输入密码');
	                $("#pwd1").focus();
	            } else if (code == '' || code.length != 4) {
	                ErroAlert('输入验证码');
	            } else {
	                //认证中..
	                fullscreen();
	                $('.login').addClass('test'); //倾斜特效
	                setTimeout(function () {
	                    $('.login').addClass('testtwo'); //平移特效
	                }, 300);
	                setTimeout(function () {
	                    $('.authent').show().animate({ right: -320 }, {
	                        easing: 'easeOutQuint',
	                        duration: 600,
	                        queue: false
	                    });
	                    $('.authent').animate({ opacity: 1 }, {
	                        duration: 200,
	                        queue: false
	                    }).addClass('visible');
	                }, 500);

	                //登录
	                var JsonData = { login: login, pwd: pwd, code: code, type: type,pwd1: pwd1 };
					//此处做为ajax内部判断
					var url = "";
					
					$.getJSON("<%=request.getContextPath()%>/register",JsonData,function(data){
						
						if(JsonData.code.toUpperCase() != CodeVal.toUpperCase()){
							
							url = "Ajax/LoginFalse";
						
						}else if(data.flag == "1"){
							
							url = "Ajax/Login";
						
						}else{
							
							url = "Ajax/LoginFalse";
						}
					
	                AjaxPost(url, JsonData,
	                                function () {
	                                    //ajax加载中
	                                },
	                                function (data) {
	                                    //ajax返回 
	                                    //认证完成
	                                    setTimeout(function () {
	                                        $('.authent').show().animate({ right: 90 }, {
	                                            easing: 'easeOutQuint',
	                                            duration: 600,
	                                            queue: false
	                                        });
	                                        $('.authent').animate({ opacity: 0 }, {
	                                            duration: 200,
	                                            queue: false
	                                        }).addClass('visible');
	                                        $('.login').removeClass('testtwo'); //平移特效
	                                    }, 1600);
	                                    setTimeout(function () {
	                                        $('.authent').hide();
	                                        $('.login').removeClass('test');
	                                        if (data.Status == 'ok') {
	                                            //登录成功
	                                            $('.login div').fadeOut(100);
	                                            $('.success').fadeIn(1000);
	                                            location.href = "login.jsp";
												//跳转操作
												
	                                        } else {
	                                            AjaxErro(data);
	                                        }
	                                    }, 1600);
	                                })
					});
	            }
	        })
	    })
	    var fullscreen = function () {
	        elem = document.body;
	        if (elem.webkitRequestFullScreen) {
	            elem.webkitRequestFullScreen();
	        } else if (elem.mozRequestFullScreen) {
	            elem.mozRequestFullScreen();
	        } else if (elem.requestFullScreen) {
	            elem.requestFullscreen();
	        } else {
	            //浏览器不支持全屏API或已被禁用  
	        }
	    }  
		if(ajaxmockjax == 1){
			$.mockjax({  
				url: 'Ajax/Login',  
				status: 200,  
				responseTime: 50,          
				responseText: {"Status":"ok","Text":"登录成功<br /><br />欢迎回来"}  
			}); 
			$.mockjax({  
				url: 'Ajax/LoginFalse',  
				status: 200,  
				responseTime: 50,          
				responseText: {"Status":"Erro","Erro":"用户名或密码或验证码有误"}
			});   
		}
		function userInput(){

			var login = $('input[name="login"]').val();
			
			var JsonData = {login:login};
			
			$.getJSON("<%=request.getContextPath()%>/confirm",JsonData,function(data){
				
				if(data.flag == "1"){
					
					ErroAlert("该用户名已经存在");
					
					$("#login").focus();
				}else{
					$("#span1").html("");
				}
				
			});
		};
    </script>

</body>
</html>
