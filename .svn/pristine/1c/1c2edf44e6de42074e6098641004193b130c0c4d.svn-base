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
		$("#levellist").datagrid({
			title : '审核列表',
			//iconCls : 'icon icon-icon16',
			width : 'auto',
			height : 'auto',
			//pageSize : 20,
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,
			fit : true,
			url : 'level/levelList.html',
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
	function applyed(id){
		$.post("level/applyed.html",{id:id},function(data){
			data = eval('(' + data + ')');
			if(data.result){
				$.messager.alert("操作提示", "审核成功！","info");
				$("#levellist").datagrid("reload");
			}else{
				$.messager.alert("操作提示",data.msg,"info");
			}
		});
	}
</script>

</head>

<body>
	<jsp:include page="header.jsp" />
	<div style="width:100%;height:400px;text-align: center;clear:both">
	<table id="levellist" cellspacing="0" cellpadding="0"
		data-options="toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'accountname',width:100">姓名</th>
				<th data-options="field:'usercode',width:150">登录名称</th>
				<th data-options="field:'paymenttype',width:150">支付方式</th>
				<th data-options="field:'account',width:150">支付账号</th>
				<th data-options="field:'phone',width:150">手机号</th>
				<!-- <th data-options="field:'cash',width:150">金额</th> -->
				<th data-options="field:'level',width:150">备注</th>
				<th data-options="field:'oper',width:150">操作</th>
			</tr>
		</thead>
	</table>
	</div>
	<br/>
	<jsp:include page="footer.jsp" />
</body>
</html>
