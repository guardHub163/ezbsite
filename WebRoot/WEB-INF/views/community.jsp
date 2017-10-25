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
<style type="text/css">
/* a:link {
	font-size: 18px;
	color: blue;
	text-decoration: none;
}

a:visited {
	font-size: 18px;
	color: red;
	text-decoration: none;
}

a:hover {
	font-size: 18px;
	color: red;
	text-decoration: underline;
} */
#list{
	height: 600px;
}
</style>

</head>

<body>
	<jsp:include page="header.jsp" />
	<div style="margin-left: 110px;">
	<div id="list">
		<span style="color:#F00;font-weight:bold;font-size:21px">社群公告</span><br>
		<hr />
		<table border="0" cellpadding="1" cellspacing="0">
			<!-- <tr>
				<td><a href="javascript:click(0)"><u>好消息，梦想金融最新公排玩法；</u></a>[2015-12-3]</td>
			</tr> -->
			<tr>
				<td><a href="javascript:click(1)"><u>发广告上拉下挖被封号清单</u></a>[2015-11-27]</td>
			</tr>
			<tr>
				<td><a href="javascript:click(2)"><u>最新一个人多个点位被封清单</u></a>[2015-11-25]</td>
			</tr>
			<tr>
				<td><a href="javascript:click(3)"><u>会员拉人、发广告封号</u></a>[2015-11-24]</td>
			</tr>
			<tr>
				<td><a href="javascript:click(4)"><u>关于会员升级联系不上的问题</u></a>[2015-11-4]</td>
			</tr>
			<tr>
				<td><a href="javascript:click(5)"><u>会员名统一修改为资料里微信昵称 </u></a>[2015-10-29]</td>
			</tr>
			<tr>
				<td><a href="javascript:click(6)"><u>公告</u></a>[2015-9-11]</td>
			</tr>
		</table>
	</div>
	<!-- <div id="div0" style="display: none;" >
		公告(2015-12-3)
		<h2 style="color:red;" align="center">好消息，梦想金融最新公排玩法；</h2>
		好消息，梦想金融最新公排玩法；<br> 梦想金融与“爱心互助社群”合作！<br>
		随着梦想金融玩家越来越多，赚钱的玩家也越来越多，还有相当一部分玩家因为各种诱惑和自身原因没有赚到钱！<br>
		为了让每一位相信梦想金融的家人都赚到钱！<br> 我们和“爱心互助社群”合作，引进全国独家的系统全自动公排的玩法；<br>
		●玩法条件：<br> 1、仅需100元加入“爱心互助社群”；<br>
		2、选出2位合作伙伴加入，即可申请加入系统全自动公排；<br> ●申请公排流程：<br>
		1、推荐2个人加入，您可以赚50元/人，2个人赚100元；<br>
		2、拿赚到的100元申请“系统全自动公排”，坐等收红包给下级确认升级；<br> ●收益：<br>
		1、最快9天赚20000元（2万元），最快15天赚60000元（6万）；<br> ●优势：<br>
		1、短平快，5层赚6万就出局了；<br> 2、可回归，出局后方可立即再重新排队公排；<br>
		3、推广二维码，方便在微信社群里里推广注册；<br> 4、注册简单，仅需姓名、微信、手机号即可；<br>
		5、注册快速，最快10秒即可完成注册；<br> 6、每个扫描你二维码注册的，你都获得50元/人，即动态，无上限；<br>
		7、真正的静态+动态收益，真正的理财；<br> ◎注意：<br>
		您的梦想金融账号依然需要保管好，团队依然需要管理好，梦想金融建立团队筛选人才也赚钱，再输送<br> <br>
		到“爱心互助社群”赚双倍丰厚收益！<br> ◆公开注册时间：2015年12月3日21:00<br> ◆关于新人注册规则：<br>
		1、请在公开注册时间后，优先找您的推荐人扫描二维码注册；<br>
		2、如果您的推荐人不在线或者还没有注册，方可立即在您所在微信群找其他家人扫描二维码注册；<br> 梦想金融示<br>
		2015年12月3日<br>
		<hr />
		<div style="text-align:center">
			<a href="javascript:back(0)">返回</a>
		</div>
	</div> -->
	<div id="div1" style="display: none;padding-left:5px;">
		公告(2015-11-27)
		<h2 style="color:red;" align="center">广告上拉下挖被封号清单</h2>
		因梦想金融10元模式新增会员倍增！ 进来一批别有用心的人 对升级的上级，发广告拉人 对找他升级的下级，发广告挖人<br> <br>
		上拉下挖，对梦想金融各个社群造成严重的影响！ 做梦想金融我们不反对做其他项目 但我们绝对反对你还拉其他梦想会员去做你做的项目<br>
		<br> 经过我们多方面证实核对后，对以下会员作出永久封账号处理！ 上拉下挖被封号的有：<br> <br>
		370234（摩根币玩家）、360939(稻草人)、389235(理财~淼淼)、335604（天地人和）、379334（李孟）、389108（阿才）、384116（哭泣的叶子）、364085（成功）、330102（10*10*10）、361447（小斌）、339443（摩根理财规划师）347103(刘引亮)；
		<br> <br> 欢迎各位家人继续举报，再发现绝不姑息！ <br> <br>梦想金融示<br>
		<br> 2015年11月27日<br>
		<hr />
		<div style="text-align:center">
			<a href="javascript:back(1)">返回</a>
		</div>
	</div>
	<div id="div2" style="display: none;">
		公告(2015-11-25)
		<h2 style="color:red;" align="center">最新一个人多个点位被封清单
			2015年11月25日违禁被封清单</h2>
		最近梦想金融五种模式玩家居多， 频频出现一个人注册霸占多个点位现象 对梦想金融社群其他会员造成了恶劣的影响！<br> <br>
		官网【游戏规则】第一条就是： <br> <br> <span
			style="color:#F00;font-weight:bold;font-size:25px;">一个人只能注册一个点位，违规者封号终身不得加盟梦想金融！</span><br>
		<br> 经过多方面信息核对，对以下违反以上游戏规则的会员作出永久封号处理！ <br> <br>违反以上规定的有：<br>
		<br>
		335694、眼镜哥、赵明阳、贝壳王子、苏富康、苏富康3、苏权威、沙漠里的鱼、338962、金融、百卡汇聊城、我、敏雪地靴批发、爱你才完美、哈哈、等会、张敏霞、殷丽娜、常相玲！<br>
		<br> 以上会员不得再加盟梦想金融！ 再发现有以上情况，绝不姑息！<br> <br> 梦想金融示 <br>
		<br>2015年11月25日<br> <br>
		<hr />
		<div style="text-align:center">
			<a href="javascript:back(2)">返回</a>
		</div>
	</div>
	<div id="div3" style="display: none;">
		公告(2015-11-24)
		<h2 style="color:red;" align="center">会员拉人、发广告封号</h2>
		近日由于10元模式门槛低，注册量与日俱增<br> <br> 出现了很多优秀的领导人，也出现了很多其他项目挖人的！<br>
		<br> 挖人的是上拉下挖！<br> <br> 给之前升级的上级发广告、拉人<br> <br>
		给找他升级的下级，发广告、私聊其他项目<br> <br> 导致某些梦想会员向我们反映：被他的项目所骗！<br>
		<br> 因此作出以下决定，对所有有给上级、下级发广告的会员！<br> <br>
		经过核实一律封号处理，终身不得再注册梦想金融！<br> <br> 梦想金融示<br> <br>
		2015年11月24日<br>
		<hr />
		<div style="text-align:center">
			<a href="javascript:back(3)">返回</a>
		</div>
	</div>
	<div id="div4" style="display: none;">
		公告(2015-11-4)
		<h2 style="color:red;" align="center">关于会员升级联系不上的问题</h2>
		近来由于团队发展迅猛，很多团队人数迅速增加，所以他们需要快速升级，但由于上级不积极，导致下级积极的需要升级的，联系不上他！<br>
		<br> 影响下级升级，从而可能导致下级被超越的可能，导致要升级的下级经济损失！从而影响下级团队的发展！<br> <br>
		因此作出以下规定：<br> <br>
		1、资料里留的微信号搜不到，电话不接、不是本人的，如果经过官方核实属实，立即清理账号！<br> <br>
		2、如果下级联系你升级开始算起！<br> 10元模式超过6小时不给下级确认升级，将会清理账号处理！<br>
		20元模式超过8小时不给下级确认升级，将会清理账号处理！<br> 50元模式超过10小时不给下级确认升级，将会清理账号处理！<br>
		10元模式超过12小时不给下级确认升级，将会清理账号处理！<br> 80元模式超过14小时不给下级确认升级，将会清理账号处理！<br>
		以上情况，无论你是几级账号！<br> <br> 请各位会员积极给下级确认升级，以免超过时间，导致自己账号被清理的状况！<br>
		梦想金融官方示<br> 2015年11月4日<br>
		<hr />
		<div style="text-align:center">
			<a href="javascript:back(4)">返回</a>
		</div>
	</div>
	<div id="div5" style="display: none;">
		公告(2015-10-29)
		<h2 style="color:red;" align="center">会员名统一修改为资料里微信昵称</h2>
		进来梦想金融自从10元模式上线,<br> 出现了注册井喷的火爆态势<br> 为了让各个团队科学管理<br> <br>
		梦想金融官方会员名调整为：<br> <br> 【会员名】和【修改资料】里的【微信昵称】一致<br> <br>
		【会员名】可以汉字、数字、字母<br> <br> 新注册会员名统一写微信昵称<br> <br>
		老会员会员名可以向官方服务号：bccwjr申请修改<br> <br> 登陆统一用会员编号登陆<br> <br>
		请各位团队领导人通知传递下去<br> <br> 以免造成登陆不上系统的情况<br> <br>
		梦想金融官方示<br> 2015年10月30日 <br>
		<hr />
		<div style="text-align:center">
			<a href="javascript:back(5)">返回</a>
		</div>
	</div>
	<div id="div6" style="display: none;">
		公告(2015-9-11)
		<h2 style="color:red;" align="center">公告</h2>

		凡拉进群的客户由其推荐人负责注册，旁线可帮助沟通但不能抢线注册，一经发现群内抢别人客户注册现象并经查证属实的，平台将对抢线注册的会员给予连降2级处理，如有再犯直接予以封号。
		敬请各位会员共同遵照执行，共同创建一个和谐、团结的微信群平台，共同携手实现时间和财富自由的目标。 <br>
		进入梦想金融就是一家人，应互帮互助，过于自私的行为必将受到大家的遣责，平台也将公平、公正予以适当处罚，并保护好每一位会员的利益不受损失，让家人们全身心做好发展工作！
		<br> 市场运作规定！！！ <br>
		为了在梦想金融平台团队的利益,凡是有以下情况之一，一律封位，不退款！终身不可参加： <br>
		1.成为一级会员后，不积极，有诋毁平台，言行不利于团队发展，对平台和团队发展不利者 <br>
		2.上级滑落下来的会员，不配合开通的； <br> 3.升级收到款项否认收款，不确认收款的； <br>
		4.下层会员升级电话联系不理不采的，被投诉三次以上的； <br> 5.下层团队都要升级，自已不主动升级的。妨碍团队整体业绩发展 <br>
		6.会员加入别的公司拉人，诋毁公司，诋毁团队，给公司名益造成损失的 <br> 以上各项经核实属实立即生效 <br>
		梦想金融官方示 <br>
		<hr />
		<div style="text-align:center">
			<a href="javascript:back(6)">返回</a>
		</div>
	</div></div>
	<script type="text/javascript">
		function click(value) {
			if (value == 0) {
				document.getElementById("list").style.display = "none";//
				document.getElementById("div0").style.display = "";//
			} else if (value == 1) {
				document.getElementById("list").style.display = "none";//
				document.getElementById("div1").style.display = "";//
			} else if (value == 2) {
				document.getElementById("list").style.display = "none";//
				document.getElementById("div2").style.display = "";//
			} else if (value == 3) {
				document.getElementById("list").style.display = "none";//
				document.getElementById("div3").style.display = "";//
			} else if (value == 4) {
				document.getElementById("list").style.display = "none";//
				document.getElementById("div4").style.display = "";//
			} else if (value == 5) {
				document.getElementById("list").style.display = "none";//
				document.getElementById("div5").style.display = "";//
			} else if (value == 6) {
				document.getElementById("list").style.display = "none";//
				document.getElementById("div6").style.display = "";//
			}
		}
		function back(value) {
			if (value == 0) {
				document.getElementById("div0").style.display = "none";//
				document.getElementById("list").style.display = "";//
			} else if (value == 1) {
				document.getElementById("div1").style.display = "none";//
				document.getElementById("list").style.display = "";//
			} else if (value == 2) {
				document.getElementById("div2").style.display = "none";//
				document.getElementById("list").style.display = "";//
			} else if (value == 3) {
				document.getElementById("div3").style.display = "none";//
				document.getElementById("list").style.display = "";//
			} else if (value == 4) {
				document.getElementById("div4").style.display = "none";//
				document.getElementById("list").style.display = "";//
			} else if (value == 5) {
				document.getElementById("div5").style.display = "none";//
				document.getElementById("list").style.display = "";//
			} else if (value == 6) {
				document.getElementById("div6").style.display = "none";//
				document.getElementById("list").style.display = "";//
			}
		}
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>
