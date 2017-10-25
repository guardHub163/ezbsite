<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>梦想金融</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="css/Site.css">
<script src="js/jquery.min.js"></script>
<script src="Scripts/jquery-1.4.1.js"></script>
<script src="js/kefu.js" type="text/javascript"></script> -->
<jsp:include page="script.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$("#code").blur(function(){
			var code = $("#code").val();
			//alert(code);
			if(code == null || code.length == 0){
				return false;
			}
			$.ajax({
				type : 'POST',
				url : "code/YZ.html",
				data : {
					"code":code
				},
				success : function(msg) {
						data = eval('(' + msg + ')');
						if (!data.result) {
							alert("验证码错误，请重新输入！");
							$("#code").val("");
							return false;
						}
				}
			});
		});
	});
	
	function login(){		
		var usercode = document.getElementById("usercode").value;
		var password = document.getElementById("password").value;
		var code = $("#code").val();
		var oldCode = $("#oldCode").val();
		//alert(code);
		//alert(oldCode);
		if(code == null || code.length == 0){
			alert("请输入验证码");
			return false;
		}
		
		var data = {
			"usercode":usercode,
			"password":password
		};
		
		$.ajax({
			type : 'POST',
			url : "login/login.html",
			data : {
				"usercode":usercode,
				 "password":password
			},
			success : function(msg) {
					//alert(msg);
					data = eval('(' + msg + ')');
					
					if (data.result) {
						window.location.href="index.html";
						//alert("登陆成功！");						
					} else {
						alert("用户不存在或密码错误！ ");
					}
			}
		});
	}

	function changeImg() {
		var imgSrc = $("#imgObj");
		var src = imgSrc.attr("src");
		imgSrc.attr("src", chgUrl(src));
	
		
	}
	//时间戳   
	//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳   
	function chgUrl(url) {
		var timestamp = (new Date()).valueOf();
		url = url.substring(0, 17);
		if ((url.indexOf("&") >= 0)) {
			url = url + "×tamp=" + timestamp;
		} else {
			url = url + "?timestamp=" + timestamp;
		}
		return url;
	}
	
</script>
</head>

<body>
	<!-- LOGO及头部文字导航 -->
	<div class="head">
		<div class="dx_1000">
			<div class="logo">
				<a herf="#"> <img src="images/logo.png" /></a>
			</div>
		</div>
	</div>
	<!-- 幻灯片大图 -->
	<div class="login_img">
		<div class="dx_1000" style="height: 475px;">
			<div class="div_login">
				<div class="zhxx">
					<div class="zhm">账户名</div>
					<div class="div_input">
						<input id="usercode" type="text" class="ps_input" value="" />
					</div>
				</div>

				<div class="zhxx" style=" margin-top:20px;">
					<div class="zhm">密码</div>
					<div class="div_input">
						<input id="password" type="password" class="ps_input" value="" />
					</div>
				</div>

				<div class="zhxx" style=" margin-top:20px;">
					<div class="zhm">验证码</div>
					<div class="div_input">
						<input type="text" class="ps_input" value="" id="code"  
							style=" width:80px;float: left;" />
						<img id="imgObj" alt="验证码" onclick="changeImg()" src="code.html" style="margin-left:5px;float: left;"/>
						<!-- <a href="#" onclick="changeImg()">换一张</a> -->
						<input id="oldCode" value="${code}" type="hidden" />
					</div>
				</div>

				<div class="zhxx" style=" margin-top:20px; padding-right:20px">
					<a href="javascript:login();" class="register">登陆</a>
				</div>
			</div>


		</div>
	</div>
	<!-- 正文内容 -->

	<div class="login_main"></div>

	<!-- 脚部信息 -->
	<div class="bqxx">版权所有 ©2016 常州市俊扬纺织有限公司</div>
</body>
</html>
