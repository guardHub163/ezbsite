<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="script.jsp"></jsp:include>
	
	<script type="text/javascript">
	$(function() {
		$("#recordlist").datagrid({
			title : '申请记录',
			//iconCls : 'icon icon-icon16',
			width : 'auto',
			height : 'auto',
			//pageSize : 20,
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,
			fit : true,
			url : 'level/recordList.html',
			remoteSort : false,
			idField : 'Id',
			singleSelect : true,
			pagination : false,
			rownumbers : true

		});

		/* var p = $("#applylist").datagrid('getPager');
		$(p).pagination({
			pageList : [ 5, 10, 15, 20 ],
			beforePageText : '第',
			afterPageText : '页        共{pages}页',
			displayMsg : '当前显示{from}-{to}条记录      共{total}条记录'
		}); */

		/* $("#search").bind("click", function() {
			var conditions = {
				code : $("#code").textbox("getValue"),
				name : $("#name").textbox("getValue")
			};

			$("#applylist").datagrid('load', {
				//url:'station/stationList.html?conditions='+JSON.stringify(conditions)
				conditions : JSON.stringify(conditions)
			});
		}); */
	});
</script>
</head>

<body>
<jsp:include page="header.jsp" />
	<div style="width:100%;height:400px;text-align: center;clear:both">
	<table id="recordlist" cellspacing="0" cellpadding="0"
		data-options="toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'username',width:100">用户名</th>
				<th data-options="field:'usercode',width:300">登录名称</th>
				<th data-options="field:'applyDate',width:150">申请日期</th>
				<th data-options="field:'confirmDate',width:150">确认日期</th>
				<!-- <th data-options="field:'cash',width:150">金额</th> -->
				<th data-options="field:'level',width:150">备注</th>
				<th data-options="field:'oper',width:150">操作</th>
			</tr>
		</thead>
	</table>
	</div>
	<br/>
	<jsp:include page="footer.jsp" />
	<br>
</body>
</html>
