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

<title>管理员管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="shortcut icon" href="images/logo.ico" />
<link rel="stylesheet" type="text/css" href="css/site.css" />
<link rel="stylesheet" type="text/css"
	href="js/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script src="js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript" src="js/dialog.js"></script>
<%-- <jsp:include page="script.jsp"></jsp:include> --%>

<script type="text/javascript">
	$(function() {
		$("#user_list").datagrid({
			title : '会员列表',
			iconCls : 'icon icon-dutyers',
			width : 'auto',
			height : 'auto',
			pageSize : 20,
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,
			fit : true,
			url : 'admin/adminList.html',
			remoteSort : false,
			idField : 'id',
			singleSelect : true,
			pagination : true,
			rownumbers : true
		});

		var p = $("#user_list").datagrid('getPager');
		$(p).pagination({
			pageList : [ 5, 10, 15, 20 ],
			beforePageText : '第',
			afterPageText : '页        共{pages}页',
			displayMsg : '当前显示{from}-{to}条记录      共{total}条记录'
		});
		
		
		
		$("#btnAdd").bind("click",function(){
			showDialogWH("添加会员信息", "admin/adminInfo.html?id=0",800,580);
			reflush();
		});
		
		
		
		$("#btnDelete").bind("click",function(){
			$.messager.confirm("删除提示", "您确定要执行删除吗？", function(data) {
			var row = $("#user_list").datagrid("getSelected");
			if (row == null) {
				$.messager.alert("操作提示", "请选择一条记录再进行操作！", "error");
				return false;
			}
//			alert(row.id);
			if (data) {
				//$.messager.progress();
				$.ajax({
					type : 'POST',
					url : "admin/delete.html",
					data : {
						"id" : row.id
					},
					success : function(msg) {
							data = eval('(' + msg + ')');
							//$.messager.progress("close");
							if (data.result) {
								$.messager.alert("操作提示", "删除成功！");
								reflush();
							} else {
								$.messager.alert("操作提示", data.msg, "error");
							}
					}
				});
			}
		});
		});
	});

	function reflush() {
		$("#user_list").datagrid('reload');
	}
	
	function showDialogWH(title, url, width, height) {
		/* $("#dialog").css({'width':width,'height':height});
		$("#dialog").dialog('setTitle', title);
		$("#dialog").dialog('open').dialog('refresh', url); */
		//alert(width);
		$("#dialog").dialog({
			title : title,
			href : url,
			width : width,
			height : height,
			closed : true,
			cache : false,
			modal : true
		}).dialog("open");
	}

</script>
</head>


<body class="easyui-layout" id="cc">
	
	<table id="user_list" cellspacing="0" cellpadding="0"
		data-options="toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'id',width:100">会员编号</th>
				<th data-options="field:'usercode',width:150">会员名</th>
				<th data-options="field:'cardnumber',width:100">身份证号</th>
				<th data-options="field:'phone',width:100">手机号码</th>
				<th data-options="field:'wechatnumber',width:100">微信号码</th>
				<th data-options="field:'referee',width:100">推荐人编号</th>
				<th data-options="field:'level',width:130">等级</th>
				<th data-options="field:'isadmin',width:130">是否管理员</th>
			</tr>
		</thead>
	</table>

	<div id="tb"
		style="padding: 2px 15px; text-align: left; vertical-align: middle;margin:2 auto;line-height: 30px">
		<a id="btnAdd" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-add'">新增</a>  <a
			id="btnDelete" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-clear'">手动出局</a> 
		
	</div>
	<div id="dialog"></div>
	<div id="window"></div>
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>
