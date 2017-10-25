<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'uplaod.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery.min.js"></script>
  </head>
  
  <body>
    <input id='fileName' type="text" name="fileName"/>
	<a href="uplaod/download.html" target="blank"><button>下载</button></a>

  </body>
  <script type="text/javascript">
	$(function(){
		$('a').click(function(){
			var link=this.href+'?'+'fileName='+$('#fileName').val();
			window.open(link);
			return false;
		});
	});
</script>
  
</html>
