<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">

							<form action="medicalorder/${msg }.do" name="Form" id="Form"
								method="post">
								<input type="hidden" name="MEDICALORDER_ID" id="MEDICALORDER_ID"
									value="${pd.MEDICALORDER_ID}" />
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">订单号:</td>
											<td>${pd.ORDERNO}</td>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">订单生成时间:</td>
											<td>${pd.ORDERGENERATIONTIME}</td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">订单预约时间:</td>
											<td>${pd.ORDERBOOKINGTIME}</td>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">订单实际执行时间:</td>
											<td>${pd.ORDEREXECUTIONTIME}</td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">订单状态:</td>
											<td>${pd.STATUS}</td>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">订单总金额:</td>
											<td>${pd.ORDERTOTALAMOUNT}</td>
										</tr>
										<c:choose>
											<c:when test="${not empty medicalOrders}">
												<c:forEach items="${medicalOrders }" var="medicalOrder">
													<tr>
														<td style="text-align: center;" colspan="10">
															<table id="simple-table"
																class="table table-striped table-bordered table-hover"
																style="margin-top: 5px;">
																<caption style="text-align: center;">${medicalOrder.NAME }订单</caption>
																<thead>
																	<tr>
																		<th class="center" colspan="4">订单基本信息</th>
																	</tr>
																	<tr>
																		<th class="center">订单号</th>
																		<th class="center">预约时间</th>
																		<th class="center">实际执行时间</th>
																		<th class="center">状态</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class='center'>${medicalOrder.MEDICALORDERNO}</td>
																		<td class='center'>${medicalOrder.MEDICALORDERBOOKINGTIME}</td>
																		<td class='center'>${medicalOrder.MEDICALORDEREXECUTIONTIME}</td>
																		<td class='center'>${medicalOrder.STATUS}</td>
																	</tr>
																	<!-- 开始循环 -->
																<thead>
																	<tr>
																		<th class="center" colspan="4">订单项目信息</th>
																	</tr>
																	<tr>
																		<th class="center">名称</th>
																		<th class="center">特征</th>
																		<th class="center">销售价格</th>
																		<th class="center">结算价格</th>
																	</tr>
																</thead>
																<c:forEach items="${medicalOrder.items}" var="var"
																	varStatus="vs">
																	<tr>
																		<td class='center'>${var.NAME}</td>
																		<td class='center'>${var.FEATURES}</td>
																		<td class='center'>${var.SELLINGPRICE}</td>
																		<td class='center'>${var.SETTLEMENTPRICE}</td>
																	</tr>
																</c:forEach>
																</tbody>
															</table>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td style="text-align: center;" colspan="10">
														<table id="simple-table"
															class="table table-striped table-bordered table-hover"
															style="margin-top: 5px;">
															<caption style="text-align: center;">体检项目信息</caption>
															<thead>
																<tr>
																	<th class="center">名称</th>
																	<th class="center">特征</th>
																	<th class="center">销售价格</th>
																	<th class="center">结算价格</th>
																</tr>
															</thead>
															<tbody>
																<!-- 开始循环 -->
																<c:forEach items="${item}" var="var" varStatus="vs">
																	<tr>
																		<td class='center'>${var.NAME}</td>
																		<td class='center'>${var.FEATURES}</td>
																		<td class='center'>${var.SELLINGPRICE}</td>
																		<td class='center'>${var.SETTLEMENTPRICE}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-danger"
												onclick="top.Dialog.close();">取消</a></td>
										</tr>
									</table>
								</div>

								<div id="zhongxin2" class="center" style="display: none">
									<br />
									<br />
									<br />
									<br />
									<br />
									<img src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green">提交中...</h4>
								</div>

							</form>

							<div id="zhongxin2" class="center" style="display: none">
								<img src="static/images/jzx.gif" style="width: 50px;" /><br />
								<h4 class="lighter block green"></h4>
							</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		//保存
		function save() {
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
		});
	</script>
</body>
</html>