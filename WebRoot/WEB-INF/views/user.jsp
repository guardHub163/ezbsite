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
<link rel="stylesheet" type="text/css"
	href="js/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css" />
<jsp:include page="script.jsp"></jsp:include>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script src="js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#payment").combobox({
			url : 'paramers/payment.html',
			valueField : 'id',
			textField : 'text',
			editable : false,
			required : true,
			value : $("#payment").val()
		});
		
		$("#area").combobox({
			url : 'paramers/area.html',
			valueField : 'id',
			textField : 'text',
			editable : false,
			required : true,
			value : $("#area").val()
		});
		
		$("#tt").tree({
			/* url : 'organization/bind.html', */
			url : 'user/userTree.html',
		
			onClick : function(node) {
				$.ajax({
					type : "POST",
					url : "user/isCreate.html",
					dataType : "text",
					success : function(msg) {
						data = eval('(' + msg + ')');
						$.messager.progress("close");
						if (data.result) {
							document.getElementById("div1").style.display = "none";//
							document.getElementById("div2").style.display = "";//
						} else {
							$.messager.alert("操作提示", data.msg, "error");
						}					
					}
				});
			
				
			}
		});
		
		$("#usercode").textbox({
		　　onChange: function (newValue,oldValue) {
			$.get("user/exsitUserCode.html", { userCode: $("#usercode").textbox("getValue") }, function(msg){
			    data = eval('(' + msg + ')');
			    if(!data.result)
			    {
			    	$("#usercode").textbox("clear").textbox("textbox").focus();;
			    	$.messager.alert('会员名已存在！！！');
			    }
		     }); 
		　　}
		});
		
		$("#sub").bind("click", function() {
			/* $.messager.progress(); */

			var isValid = $("#ffemp").form('validate');
			if (!isValid) {
				$.messager.progress('close');
				return false;
			}
			var data = {
				"id" : $("#code").val(),
				"usercode" : $("#usercode").textbox("getValue"),
				"username" : $("#usercode").textbox("getValue"),
				"password" : $("#password").textbox("getValue"),
				"secondpassword" : "0",
				"cardnumber" : "0",
				"phone" : $("#phone").textbox("getValue"),
				"wechatnumber" : $("#weChat").textbox("getValue"),
				"email" : "0",
				"paymenttype" : "0",
				//"account" : $("#account").textbox("getValue"),
				"accountname" : $("#accountName").textbox("getValue"),
				"referee" : $("#TJCode").textbox("getValue")//,
				//"contact" : $("#JDCode").textbox("getValue"),
				//"area" : $("#area").combobox("getValue"),
			};

			$.ajax({
				type : "POST",
				url : "user/save.html",
				dataType : "text",
				data : {
					"jsonStr" : JSON.stringify(data)
				},
				success : function() {
					//$.messager.progress('close');
					//reflush();
					//$('#dialog').window('close');
					//$.messager.alert("保存成功！");
					document.getElementById("div2").style.display = "none";//
					document.getElementById("div1").style.display = "";//
					$("#tt").tree({
						url : 'user/userTree.html'
					});
				}
			});
		});
		

		$("#can").bind('click', function() {
			document.getElementById("div2").style.display = "none";//
			document.getElementById("div1").style.display = "";//
		});
		
		

	});
</script>

</head>

<body>
	<jsp:include page="header.jsp" />
	<div id="div1" style="width:890;height: 50%;margin-left: 110px;">
		<ul id="tt" style="width:30%"></ul>
	</div>
	<div id="div2" style="display:none;margin-left: 110px;">
		<div style="border:1px solid #F00;width:95%">
			<span style="color:#F00;font-weight:bold;font-size:21px;">填写说明：</span><br>
			一、如果您注册成为梦想金融微金融编号，请您立即汇款，汇款金额在您注册结束后显示，如不及时汇款，将影响您的业务进程，本社群将删除您的注册信息，谢谢合作！<br>
			<br> 二、标有红底色的栏目必须填写清楚。<br>
			<br> 三、填写的密码一定不要与你的银行卡密码相同或类似，强烈建议使用字母和数字混合的密码！！！<br>
		</div>
		<form id="ffemp" method="post"
			style="margin-top: 10px; text-align: center;">
			<table style="width:95%;line-height: 30px;" cellpadding="0"
				cellspacing="0" border="1">
				<tr>
					<td colspan="2" align="center" style="background: #FDDDBE">会员申请表</td>
				</tr>
				<tr>
					<td align="right" style="width: 20%"><label for="code">会员编号:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="code"
						class="easyui-textbox" name="code" value="${code}"
						style="width:250px;" data-options="required:true,editable:false" /></td>
				</tr>
				<tr>
					<td align="right"><label for="usercode">会员名:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="usercode"
						class="easyui-textbox" name="usercode" style="width:250px;"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right"><label for="password">一级密码:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="password"
						class="easyui-textbox" name="password" type="password"
						style="width:250px;" data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right"><label for="confirmPass">确认一级密码:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="confirmPass"
						class="easyui-textbox" type="password" style="width:250px;"
						name="confirmPass"
						data-options="required:true,events:{blur: 
									function(){
									
										var password = $('#password').val();
										var confirmPass = $('#confirmPass').val();
										if(confirmPass ==null || confirmPass.length==0){
											return false;
										}
										if(password != confirmPass){
											$('#confirmPass').textbox('clear').textbox('textbox').focus();;
										    	alert('一级密码不一致！！！');
										}
										
									}}" /></td>
				</tr>
				<!-- <tr>
					<td align="right"><label for="secondPass">二级密码:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="secondPass"
						class="easyui-textbox" type="password" style="width:250px;"
						name="secondPass" data-options="required:true" /></td>
				</tr> -->
				<!-- <tr>
					<td align="right"><label for="confirmSecondPass">确认二级密码:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="confirmSecondPass"
						class="easyui-textbox" type="password" style="width:250px;"
						name="confirmSecondPass"
						data-options="required:true,events:{blur: 
									function(){
										var secondPass = $('#secondPass').val();
										var confirmSecondPass = $('#confirmSecondPass').val();
										if(confirmSecondPass ==null || confirmSecondPass.length==0){
											return false;
										}
										if(secondPass !=confirmSecondPass){
											$('#confirmSecondPass').textbox('clear').textbox('textbox').focus();;
										    	alert('二级密码不一致！！！');
										}
										
									}}" /></td>
				</tr> 
				<tr>
					<td align="right"><label for="cardNumber">身份证号:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="cardNumber"
						class="easyui-textbox" style="width:250px;" name="cardNumber"
						data-options="required:true" /></td>
				</tr>-->
				<tr>
					<td align="right"><label for="phone">手机号码:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="phone"
						class="easyui-textbox" name="phone" style="width:250px;"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right"><label for="weChat">微信号码:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="weChat"
						class="easyui-textbox" name="weChat" style="width:250px;"
						data-options="required:true,events:{blur: 
									function(){									
										var weChat = $('#weChat').val();
										$.ajax({
											type : 'POST',
											url : 'user/exsitWeChat.html',
											dataType : 'text',
											data : {
												'weChat' : weChat
											},
											success : function(msg) {												
												data = eval('(' + msg + ')');
												if (!data.result) {
													alert('微信已存在！');
													$('#weChat').textbox('clear').textbox('textbox').focus();;
													return false;
												}
											}
										});								
									}}" /></td>
				</tr>
				<!-- <tr>
					<td align="right"><label for="email">常用联系邮箱:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="email"
						class="easyui-textbox" name="email" style="width:250px;"
						data-options="validType:'email'" /></td>
				</tr>

				<tr>
					<td align="right"><label for="payment">付款方式:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="payment" name="payment"
						style="width:250px;" />
					</td>
				</tr> -->
				<!-- <tr>
					<td align="right"><label for="account">账号:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="account"
						class="easyui-textbox" name="account" style="width:250px;"
						data-options="required:true" /></td>
				</tr> -->
				<tr>
					<td align="right"><label for="accountName">姓名:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="accountName"
						class="easyui-textbox" style="width:250px;" name="accountName"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right"><label for="TJCode">推荐人编号:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="TJCode"
						value="${TJCode}" class="easyui-textbox" name="TJCode"
						style="width:250px;" data-options="required:true,editable:false" /></td>
				</tr>
				<!-- <tr>
					<td align="right"><label for="JDCode">接点人编号:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="JDCode"
						class="easyui-textbox" name="JDCode" style="width:250px;"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right"><label for="area">区域:</label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="area" name="area"
						style="width:250px;" /></td>
				</tr> -->

			</table>
			&nbsp;
			<div id="btn" style="text-align: center; ">
				<a id="sub" href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-save'">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					id="can" href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-cancel'">取消</a>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
