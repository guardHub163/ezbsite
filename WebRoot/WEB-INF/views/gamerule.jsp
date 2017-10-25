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

<title>游戏规则</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="script.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div style="margin-left:110px;line-height:32px;">
		<table style="width: 94%; line-height:32px;" border="1"
			cellpadding="1" cellspacing="0">
			<tr>
				<td><span style="color:#F00;font-weight:bold;font-size:21px;">一个人只能注册一个点位，违规者封号终身不得加盟梦想金融！</span>

					<br> ★★ 保持您的100%利润 <br> ★★ 不需要等待公司支付 <br> ★★ 直接向您付款
					<br> ★★ 不需要有经验 <br> ★★ 3x8强制矩阵 <br> ★★ 只需要10元来启动，
					所有人都能承担得起 <br> ★★ 没有每月的服务费也没有管理费 <br> ★★
					您也为所需要帮助的人，献出您的爱心</td>
			</tr>
			<tr>
				<td><span style="color:#F00;font-weight:bold;font-size:21px;">《游
						戏 规 则 》</span></td>
			</tr>
			<tr>
				<td>游戏的具体规则如下： <br>

					1.凡年满18岁的公民，自愿缴纳10元的爱心资金，即可成为梦想金融的正式会员，享有梦想金融会员的一切权利和义务。一旦确认为梦想金融的正式会员，其自愿缴纳的10元会员费，在任何情况下，俱乐部都实行"不退款"政策。因此，有家庭财政
					压力者慎重考虑，梦想金融建议其暂缓参与。 <br>

					2.会员的所有付款均由其本人直接支付给上层会员，俱乐部从始至终不接受任何会员的付款。梦想金融的责任是为会员搭建一个交友平台。 <br>
					3.新朋友加盟时，会通过系统进行"注册"获得一个会员编号。系统会安排推荐的会员接收其10元会员费。新朋友缴纳了会员费并得到收款会员的激活确认后，即成为正式会员。正式会员可参与梦想金融的倍增财富游戏，并享有接收下层会员爱心款的权利。
					<br>
					4.梦想金融采用3x8矩阵倍增系统发展爱心会员，即每个会员的第一层可以拥有3个会员，这3个会员再以3的倍数倍增会员，......依此三三复制，一直倍增至第八层。在此范围内，只要按照系统的提示支付各层应付的爱心款，及时成为各个级别的合格会员，就可以获得数额不等的爱心财富。如果有的会员朋友圈子小，找不到很多爱心朋友，三三复制的方式倍增会员，同样可以获得相应的财富。
					<br>
					<table border="1" cellpadding="1" cellspacing="0" bordercolor="red">
						<tbody>
							<tr align="center">
								<td style="width: 62px;">层 数</td>
								<td style="width: 83px; ">级 别</td>
								<td style="width: 110px; ">各层会员数</td>
								<td style="width: 110px; ">升级付款额</td>
								<td style="width: 200px; ">各层收入金额</td>
							</tr>
							<tr align="center">
								<td>第1层</td>
								<td>合格一级</td>
								<td>3人</td>
								<td>10元</td>
								<td>10元×3人=30元</td>
							</tr>
							<tr align="center">
								<td>第2层</td>
								<td>合格二级</td>
								<td>9人</td>
								<td>20元</td>
								<td>20元×9人=180元</td>
							</tr>
							<tr align="center">
								<td>第3层</td>
								<td>合格三级</td>
								<td>27人</td>
								<td>30元</td>
								<td>30元×27人=810元</td>
							</tr>
							<tr align="center">
								<td>第4层</td>
								<td>合格四级</td>
								<td>81人</td>
								<td>50元</td>
								<td>50元×81人=4050元</td>
							</tr>
							<tr align="center">
								<td>第5层</td>
								<td>合格五级</td>
								<td>243人</td>
								<td>80元</td>
								<td>80元×243人=19440元</td>
							</tr>
							<tr align="center">
								<td>第6层</td>
								<td>合格六级</td>
								<td>729人</td>
								<td>120元</td>
								<td>120元×729人=87480元</td>
							</tr>
							<tr align="center">
								<td>第7层</td>
								<td>合格七级</td>
								<td>2187人</td>
								<td>200元</td>
								<td>200元×2187人=437400元</td>
							</tr>
							<tr align="center">
								<td>第8层</td>
								<td>合格八级</td>
								<td>6561人</td>
								<td>300元</td>
								<td>300元×6561人=1968300元</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="4" align="center">合 计 9840 人 2517690元</td>

							</tr>
						</tbody>
					</table> <br>
					5.梦想金融对会员实行九级管理制。新会员为零级会员；零级会员线下第一层出现了新会员就是一级会员；线下第二层又出现了新会员就是二级会员；线下第三层再出现了新会员就是三级会员......依此类推，直至线下第八层有了新会员，就是梦想金融最高级别的八级会员。
					<br>
					6.系统采用梯形付款、梯形收款的方式倍增会员的财富。会员每上升一个级别，其收入会呈3的几何倍数倍增。从第二层起，会员拟成为某一层的合格会员时，系统会提示其向上层会员付款。只有按系统的提示完成了付款并得到收款会员的确认，才是该层（即该级别）的合格会员。反之，则为不合格会员。不合格会员没有权利接收该层会员的付款。此时，系统会绕过他另指定他人为收款人。只有当他按系统的要求完成了该层的付款，才有权利接收该层每个会员的付款。（如要成为二级正式会员，必须向上层支付升级的10元的爱心款项，然后才可以接收自己下面第二层的9人的升级见点20元,然后自己给上面的第三层的会员30元升级为三级会员后,自己就可以拿下面第三层的27人升级见点30元,、、、、以此类推到第八层。）
					<br> 7.会员付款后S，要保管好汇款凭证，并用电话或者QQ及时通知收款会员。没有及时通知收款会员进行确认，其损失自负。
					<br>
					8.收款会员收到汇款后，应在24小时内予以确认。超过24小时没有确认而造成付款会员不能及时升级不能及时收款的后果，其损失由没有及时进行收款确认的收款会员承担。收款会员累计3次不及时进行"收款确认"，俱乐部将取消其收款权利。
					<br>
					9.会员付款后，收款会员因否认收到该款而不予以确认者，经俱乐部调查证实其款已收到，此收款会员将被俱乐部终身取消其收款的权利。凡拟有此举动的会员，建议其慎之又慎！
					<br>
					10.会员注册时，其个人资料必须真实准确，且具有效性。如果遇到银行卡号变更、手机号、座机号变更等情况，一定要通过会员后台及时更改。如果更改不及时，付款方、收款方的利益都会受到影响。届时，双方的损失均由那位没有及时更改资料的会员承担。
					<br><!--  11. <br> <span style="color:red">一环：1元即可加入梦想金融1元模式，8级赚25万出局
						<br>二环：2元即可加入梦想金融2元模式，8级赚48.8万出局 <br>三环：5元即可加入梦想金融5元模式，8级赚145万出局
						<br>四环：10元即可加入梦想金融10元模式，8级赚303万出局 <br>五环：80元即可加入梦想金融80元模式，8级赚2517万出局
						五环加起来合计：3038万元
				</span> <br> 从一环做到五环，一环仅需1元，选出3个可以拿出1元的合作伙伴，好发展团队，人人可参与
					快速建立自己的团队，一环既可以赚钱又可以学习熟悉制度，又可以快速找到合作伙伴！ 为了你的团队成员不流失，建议各位一环到五环同时做！
					这样从1元入门，每一环都容易起来，你的团队将会迅速成长起来，新系统出来后， 新制度会让你的团队永远保持活力，新陈代谢！ 具体制度如下：
					<br>（1）<span style="color:red">一环会员在新注册后3天系统自动清理1级会员</span> <br>（2）<span
					style="color:red">二环会员在新注册后4天系统自动清理1级会员</span> <br>（3）<span
					style="color:red">三环会员在新注册后5天系统自动清理1级会员</span> <br>（4）<span
					style="color:red">四环会员在新注册后6天系统自动清理1级会员</span> <br>（5）<span
					style="color:red">五环会员在新注册后7天系统自动清理1级会员</span> <br>（6）<span
					style="color:red">一环到五环会员均遵循连续2次被超越系统会自动清理</span> <br> -->
					11、梦想金融保留其补充完善《游戏规则》的权利。 <br> 12.《游戏规则》解释权归梦想金融所有。 <br></td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
