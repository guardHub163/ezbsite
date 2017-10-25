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
			//url : 'station/stationList.html',
			remoteSort : false,
			idField : 'id',
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
	
	function applyLevel(){
		$.post("level/levelApply.html",function(data){
		data = eval('(' + data + ')');
			if(data.result){
				alert("祝贺您申请成功！请及时加你的上级微信号码，备注：申请升级，添加好友后，把你的会员编号发给上级并且微信转账升级费用。"+data.userInfo);
				//$.messager.alert("操作提示", "祝贺您申请成功！请及时加你的上级微信号码，备注：申请升级，添加好友后，把你的会员编号发给上级并且微信转账升级费用。"+data.userInfo,"info");
			}else{
				alert(data.msg);
				//$.messager.alert("操作提示",data.msg,"info");
			}
		});
	}
</script>

</head>

<body>
	<jsp:include page="header.jsp" />

	<div style="width:100%;height:300px;text-align: center;clear:both">
		<table id="recordlist" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th data-options="field:'name',width:100">会员等级</th>
					<th data-options="field:'remark',width:300">该等级人数</th>
					<!-- <th data-options="field:'createtime',width:150">该等级金额</th> -->
				</tr>
			</thead>
			<tbody>
			<tr>
				<td>第一级</td>
				<td>${level1 }</td>
				<%-- <td>${cash1 }</td> --%>
			</tr>
			<tr>
				<td>第二级</td>
				<td>${level2 }</td>
				<%-- <td>${cash2 }</td> --%>
			</tr>
			<tr>
				<td>第三级</td>
				<td>${level3 }</td>
				<%-- <td>${cash3 }</td> --%>
			</tr>
			<tr>
				<td>第四级</td>
				<td>${level4 }</td>
				<%-- <td>${cash4 }</td> --%>
			</tr>
			<tr>
				<td>第五级</td>
				<td>${level5 }</td>
				<%-- <td>${cash5 }</td> --%>
			</tr>
			<tr>
				<td>第六级</td>
				<td>${level6 }</td>
				<%-- <td>${cash6 }</td> --%>
			</tr>
			<tr>
				<td>第七级</td>
				<td>${level7 }</td>
				<%-- <td>${cash7 }</td> --%>
			</tr>
			<tr>
				<td>第八级</td>
				<td>${level8 }</td>
				<%-- <td>${cash8 }</td> --%>
			</tr>
			</tbody>
		</table>
	</div>
		<div style="text-align: center;">您目前的级别是：${level}级</div>
	<div style="text-align: center;">下一级别是:${nextlevel}级</div>
	<div style="text-align: center;">
		<a href="javascript:void(0)" onclick="applyLevel()"><img
			alt="点击升级" src="images/UPGRADE.jpg"></a>
	</div>
	<br />
	<jsp:include page="footer.jsp" />
	<br>
</body>
</html>
