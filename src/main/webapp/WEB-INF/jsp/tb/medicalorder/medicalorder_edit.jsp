<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					
					<form action="medicalorder/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MEDICALORDER_ID" id="MEDICALORDER_ID" value="${pd.MEDICALORDER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单编号:</td>
								<td><input type="text" name="MEDICALORDER_ID" id="MEDICALORDER_ID" value="${pd.MEDICALORDER_ID}" maxlength="255" placeholder="这里输入订单编号" title="订单编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单号:</td>
								<td><input type="text" name="ORDERNO" id="ORDERNO" value="${pd.ORDERNO}" maxlength="255" placeholder="这里输入订单号" title="订单号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单生成时间:</td>
								<td><input class="span10 date-picker" name="ORDERGENERATIONTIME" id="ORDERGENERATIONTIME" value="${pd.ORDERGENERATIONTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="订单生成时间" title="订单生成时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单预约时间:</td>
								<td><input class="span10 date-picker" name="ORDERBOOKINGTIME" id="ORDERBOOKINGTIME" value="${pd.ORDERBOOKINGTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="订单预约时间" title="订单预约时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单实际执行时间:</td>
								<td><input class="span10 date-picker" name="ORDEREXECUTIONTIME" id="ORDEREXECUTIONTIME" value="${pd.ORDEREXECUTIONTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="订单实际执行时间" title="订单实际执行时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单总金额:</td>
								<td><input type="number" name="TOTALAMOUNT" id="TOTALAMOUNT" value="${pd.TOTALAMOUNT}" maxlength="32" placeholder="这里输入订单总金额" title="订单总金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入订单状态" title="订单状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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
		function save(){
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>