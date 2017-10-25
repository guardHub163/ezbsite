<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		var menuId = $("#menuId").val();
		//alert(menuId);
		$("#xx" + menuId).unbind("mouseout");
		$("#xx" + menuId).addClass("xx_bg");
		$(".xx").click(function() {
			$('.xx').each(function() {
				$(this).removeClass("xx_bg");
			});
			$(this).unbind("mouseout");
			$(this).addClass("xx_bg");
		});
		$(".xx").mouseover(function() {
			if (!$(this).hasClass("xx_bg")) {
				$(this).one("mouseout", function() {
					$(this).removeClass("xx_bg");
				});
				$(this).addClass("xx_bg");
			}
		});
		$('#dlg').dialog({
			title : '修改密码',
			width: 300,
			height: 200,
			top:300,
			closed : true,
			cache : false,
			modal : true
		});
	});
	function menu(id) {
		switch (id) {
		case 0:
			window.open("index.html", "_self");
			break;
		case 1:
			window.open("community.html", "_self");
			break;
		/* case 2:
			window.open("communication.html", "_self");
			break; */
		case 3:
			window.open("trouble.html", "_self");
			break;
		case 4:
			window.open("gamerule.html", "_self");
			break;
		case 5:
			window.open("level.html", "_self");
			break;
		/* case 6:
			window.open("level.html", "_self");
			break;  */
		case 7:
			window.open("user.html", "_self");
			break;
		default:
			window.open("index.html", "_self");
			break;
		}
	}
	function quit() {
		window.location.href = "login.html"
	}
	function apply() {
		window.open("level/apply.html", "_self");
	}
	function record() {
		window.open("level/record.html", "_self");
	}
	function changePwd() {
		if($("#pwd").textbox("getText")!=$("#pwdag").textbox("getText")){
			alert("两次输入密码不一致");
			return false;
		}
		$.post("user/changePwd.html",{pwd:$("#pwd").textbox("getText")},function(data){
			data = eval('(' + data + ')');
			if(!data.result){
				alert(data.msg);
			}else{
				$('#dlg').dialog('close');
			}
		});
		
	}
</script>
<input type="hidden" id="menuId" value="${menuId }" />
<!-- LOGO及头部文字导航 -->
<div class="head">
	<div class="dx_1000">
		<div class="logo">
			<a herf="#"> <img src="images/logo.png" /></a>
		</div>
		<div class="cd">
			<div class="cd_01">
				会员编号：${user.getId()} | 会员昵称：${user.getUsername()} | 会员状态：正式会员 |
				会员级别：${user.getLevel()}级 | 团队会员数：${user.getTotal()}个 | <a
					href="javascript:quit()">安全退出</a>
			</div>
			<div class="cd_02">
				<a href="javascript:void(0)" onclick="apply()">申请升级</a>
				<!-- <a href="#">团队结构</a> -->
				<a href="javascript:void(0)" onclick="record()">升级记录</a> <a
					href="javascript:void(0)" onclick="$('#dlg').dialog('open')">修改密码</a>
			</div>
		</div>
	</div>
</div>
<!-- 导航栏 -->
<div class="dx_div">
	<div class="dx_1000">
		<div id="xx0" class="xx" herf="javascript:void(0)" onclick="menu(0)">首页</div>
		<div class="xx_s">|</div>
		<div id="xx1" class="xx" onclick="menu(1)">社群公告</div>
		<div class="xx_s">|</div>
		<!-- <div class="xx" onclick="menu(2)">站内通信</div>
			<div class="xx_s">|</div> -->
		<div id="xx3" class="xx" onclick="menu(3)">问题解答</div>
		<div class="xx_s">|</div>
		<div id="xx4" class="xx" onclick="menu(4)">游戏规则</div>
		<div class="xx_s">|</div>
		<div id="xx5" class="xx" onclick="menu(5)">审核状况</div>
		<div class="xx_s">|</div>
		<!-- <div class="xx" onclick="menu(6)">推荐会员管理</div>
			<div class="xx_s">|</div> -->
		<div id="xx7" class="xx" onclick="menu(7)">推荐系谱图</div>
	</div>
</div>
<!-- 幻灯片大图 -->
<div class="ztbt"></div>

<div id="dlg">
	<div style="margin-bottom:20px">
		<div>一级密码:</div>
		<input id="pwd" class="easyui-textbox" data-options="type:'password'"
			style="width:100%;height:32px">
	</div>
	<div style="margin-bottom:20px">
		<div>确认密码:</div>
		<input id="pwdag" class="easyui-textbox"
			data-options="type:'password'" style="width:100%;height:32px">
	</div>
	<div>
		<a href="javascript:void(0)" onclick="changePwd()"
			class="easyui-linkbutton" iconCls="icon-ok"
			style="width:100%;height:32px">确定修改</a>
	</div>
</div>
